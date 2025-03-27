"use client"

import { useRef, useMemo, useEffect } from "react"
import { Canvas, useFrame } from "@react-three/fiber"
import { OrbitControls } from "@react-three/drei"
import * as THREE from "three"
import { useScroll } from "framer-motion"

// Simplex noise implementation for smooth movement
function createNoise3D() {
  const p = new Uint8Array(512)
  for (let i = 0; i < 256; i++) p[i] = p[i + 256] = Math.floor(Math.random() * 256)

  const permutation = new Uint8Array(p)
  const gradP = new Array(512)

  const F3 = 1 / 3
  const G3 = 1 / 6

  const grad3 = [
    [1, 1, 0],
    [-1, 1, 0],
    [1, -1, 0],
    [-1, -1, 0],
    [1, 0, 1],
    [-1, 0, 1],
    [1, 0, -1],
    [-1, 0, -1],
    [0, 1, 1],
    [0, -1, 1],
    [0, 1, -1],
    [0, -1, -1],
  ]

  for (let i = 0; i < 512; i++) {
    gradP[i] = grad3[permutation[i & 255] % 12]
  }

  return (x, y, z) => {
    // Find unit grid cell containing point
    const i = Math.floor(x + (x + y + z) * F3)
    const j = Math.floor(y + (x + y + z) * F3)
    const k = Math.floor(z + (x + y + z) * F3)

    // Unskew the cell origin back to (x,y,z) space
    const t = (i + j + k) * G3
    const X0 = i - t
    const Y0 = j - t
    const Z0 = k - t

    // The x,y,z distances from the cell origin
    const x0 = x - X0
    const y0 = y - Y0
    const z0 = z - Z0

    // For the 3D case, the simplex shape is a tetrahedron
    // Determine which simplex we are in
    let i1, j1, k1 // Offsets for second corner of simplex in (i,j,k) coords
    let i2, j2, k2 // Offsets for third corner of simplex in (i,j,k) coords

    if (x0 >= y0) {
      if (y0 >= z0) {
        i1 = 1
        j1 = 0
        k1 = 0
        i2 = 1
        j2 = 1
        k2 = 0
      } else if (x0 >= z0) {
        i1 = 1
        j1 = 0
        k1 = 0
        i2 = 1
        j2 = 0
        k2 = 1
      } else {
        i1 = 0
        j1 = 0
        k1 = 1
        i2 = 1
        j2 = 0
        k2 = 1
      }
    } else {
      if (y0 < z0) {
        i1 = 0
        j1 = 0
        k1 = 1
        i2 = 0
        j2 = 1
        k2 = 1
      } else if (x0 < z0) {
        i1 = 0
        j1 = 1
        k1 = 0
        i2 = 0
        j2 = 1
        k2 = 1
      } else {
        i1 = 0
        j1 = 1
        k1 = 0
        i2 = 1
        j2 = 1
        k2 = 0
      }
    }

    // A step of (1,0,0) in (i,j,k) means a step of (1-c,-c,-c) in (x,y,z),
    // a step of (0,1,0) in (i,j,k) means a step of (-c,1-c,-c) in (x,y,z), and
    // a step of (0,0,1) in (i,j,k) means a step of (-c,-c,1-c) in (x,y,z), where c = 1/6.
    const x1 = x0 - i1 + G3 // Offsets for second corner in (x,y,z) coords
    const y1 = y0 - j1 + G3
    const z1 = z0 - k1 + G3
    const x2 = x0 - i2 + 2.0 * G3 // Offsets for third corner in (x,y,z) coords
    const y2 = y0 - j2 + 2.0 * G3
    const z2 = z0 - k2 + 2.0 * G3
    const x3 = x0 - 1.0 + 3.0 * G3 // Offsets for last corner in (x,y,z) coords
    const y3 = y0 - 1.0 + 3.0 * G3
    const z3 = z0 - 1.0 + 3.0 * G3

    // Calculate contribution from the four corners
    let n0, n1, n2, n3

    // Noise contribution from the four corners
    const t0 = 0.6 - x0 * x0 - y0 * y0 - z0 * z0
    if (t0 < 0) n0 = 0.0
    else {
      const gi0 = gradP[(i + permutation[(j + permutation[k & 255]) & 255]) & 255]
      n0 = t0 * t0 * t0 * t0 * (gi0[0] * x0 + gi0[1] * y0 + gi0[2] * z0)
    }

    const t1 = 0.6 - x1 * x1 - y1 * y1 - z1 * z1
    if (t1 < 0) n1 = 0.0
    else {
      const gi1 = gradP[(i + i1 + permutation[(j + j1 + permutation[(k + k1) & 255]) & 255]) & 255]
      n1 = t1 * t1 * t1 * t1 * (gi1[0] * x1 + gi1[1] * y1 + gi1[2] * z1)
    }

    const t2 = 0.6 - x2 * x2 - y2 * y2 - z2 * z2
    if (t2 < 0) n2 = 0.0
    else {
      const gi2 = gradP[(i + i2 + permutation[(j + j2 + permutation[(k + k2) & 255]) & 255]) & 255]
      n2 = t2 * t2 * t2 * t2 * (gi2[0] * x2 + gi2[1] * y2 + gi2[2] * z2)
    }

    const t3 = 0.6 - x3 * x3 - y3 * y3 - z3 * z3
    if (t3 < 0) n3 = 0.0
    else {
      const gi3 = gradP[(i + 1 + permutation[(j + 1 + permutation[(k + 1) & 255]) & 255]) & 255]
      n3 = t3 * t3 * t3 * t3 * (gi3[0] * x3 + gi3[1] * y3 + gi3[2] * z3)
    }

    // Add contributions from each corner to get the final noise value.
    // The result is scaled to stay just inside [-1,1]
    return 32.0 * (n0 + n1 + n2 + n3)
  }
}

// Simplified noise function for our purposes
const noise3D = createNoise3D()

function InstancedRectangles({ count = 100, scrollY = 0 }) {
  const mesh = useRef<THREE.InstancedMesh>(null!)
  const dummy = useMemo(() => new THREE.Object3D(), [])
  const initialPositions = useMemo(() => {
    return Array.from({ length: count }, () => ({
      position: [
        (Math.random() - 0.5) * 2, // x: -1 to 1
        (Math.random() - 0.5) * 2, // y: -1 to 1
        (Math.random() - 0.5) * 2, // z: -1 to 1
      ],
      scale: [0.05 + Math.random() * 0.1, 0.2 + Math.random() * 0.3, 0.05 + Math.random() * 0.1],
      rotation: [Math.random() * Math.PI, Math.random() * Math.PI, Math.random() * Math.PI],
      // Random colors in our palette
      color: [
        0.9 + Math.random() * 0.1, // R (pink-ish)
        0.2 + Math.random() * 0.4, // G
        0.5 + Math.random() * 0.5, // B
      ],
    }))
  }, [count])

  // Set initial colors
  useEffect(() => {
    if (mesh.current) {
      const colors = new Float32Array(count * 3)

      for (let i = 0; i < count; i++) {
        const [r, g, b] = initialPositions[i].color
        colors[i * 3] = r
        colors[i * 3 + 1] = g
        colors[i * 3 + 2] = b
      }

      mesh.current.instanceColor = new THREE.InstancedBufferAttribute(colors, 3)
    }
  }, [count, initialPositions, mesh])

  useFrame((state, delta) => {
    // Update each instance
    for (let i = 0; i < count; i++) {
      const time = state.clock.elapsedTime
      const { position, scale, rotation } = initialPositions[i]

      // Use noise and scroll position to animate
      const scrollFactor = scrollY * 0.1
      const noiseX = noise3D(position[0] + time * 0.1, position[1], position[2] + scrollFactor) * 0.2
      const noiseY = noise3D(position[0], position[1] + time * 0.1, position[2] + scrollFactor) * 0.2
      const noiseZ = noise3D(position[0], position[1], position[2] + time * 0.1 + scrollFactor) * 0.2

      // Set position with noise offset
      dummy.position.set(position[0] + noiseX, position[1] + noiseY, position[2] + noiseZ)

      // Set scale
      dummy.scale.set(scale[0], scale[1], scale[2])

      // Set rotation with some animation
      dummy.rotation.set(
        rotation[0] + time * 0.1 * (i % 2 ? 1 : -1),
        rotation[1] + time * 0.2 * (i % 3 ? 1 : -1),
        rotation[2] + time * 0.1 * (i % 4 ? 1 : -1),
      )

      dummy.updateMatrix()
      mesh.current.setMatrixAt(i, dummy.matrix)
    }

    mesh.current.instanceMatrix.needsUpdate = true
  })

  return (
    <instancedMesh ref={mesh} args={[undefined, undefined, count]}>
      <boxGeometry args={[1, 1, 1]} />
      <meshStandardMaterial />
    </instancedMesh>
  )
}

export default function InstancedRectanglesScene() {
  const { scrollYProgress } = useScroll()
  const scrollRef = useRef(0)

  useEffect(() => {
    return scrollYProgress.onChange((latest) => {
      scrollRef.current = latest * 10
    })
  }, [scrollYProgress])

  return (
    <div className="w-full h-[400px] md:h-[500px] rounded-lg overflow-hidden">
      <Canvas camera={{ position: [0, 0, 4], fov: 50 }}>
        <ambientLight intensity={0.5} />
        <pointLight position={[10, 10, 10]} intensity={1} />
        <InstancedRectangles count={150} scrollY={scrollRef.current} />
        <OrbitControls enableZoom={false} enablePan={false} />
      </Canvas>
    </div>
  )
}

