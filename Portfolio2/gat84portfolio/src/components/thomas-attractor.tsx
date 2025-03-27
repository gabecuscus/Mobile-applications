"use client"

import { useRef, useMemo, useEffect, useState } from "react"
import { Canvas, useFrame } from "@react-three/fiber"
import { OrbitControls } from "@react-three/drei"
import * as THREE from "three"
import { useScroll } from "framer-motion"

// Thomas attractor implementation
function updateThomasAttractor(x: number, y: number, z: number, b: number, dt: number) {
  // Thomas attractor equations
  // dx/dt = sin(y) - b*x
  // dy/dt = sin(z) - b*y
  // dz/dt = sin(x) - b*z

  const dx = (Math.sin(y) - b * x) * dt
  const dy = (Math.sin(z) - b * y) * dt
  const dz = (Math.sin(x) - b * z) * dt

  return [x + dx, y + dy, z + dz]
}

function InstancedRectangles({ count = 150 }) {
  const mesh = useRef<THREE.InstancedMesh>(null!)
  const dummy = useMemo(() => new THREE.Object3D(), [])
  const { scrollYProgress } = useScroll()
  const scrollRef = useRef(0)
  const prevScrollRef = useRef(0)
  const scrollDirectionRef = useRef(0) // 1 for up, -1 for down

  // Thomas attractor parameters
  const b = 0.19 // Constant for Thomas attractor
  const dt = 0.01 // Time step for integration

  // State to track positions
  const [positions, setPositions] = useState<Array<[number, number, number]>>([])
  const [initialPositions] = useState<Array<[number, number, number]>>(() =>
    Array.from({ length: count }, () => [
      (Math.random() - 0.5) * 2, // x: -1 to 1
      (Math.random() - 0.5) * 2, // y: -1 to 1
      (Math.random() - 0.5) * 2, // z: -1 to 1
    ]),
  )

  // Initialize positions
  useEffect(() => {
    setPositions(initialPositions.map((pos) => [...pos] as [number, number, number]))
  }, [initialPositions])

  // Track scroll position and direction
  useEffect(() => {
    return scrollYProgress.onChange((latest) => {
      scrollDirectionRef.current = latest > prevScrollRef.current ? -1 : 1 // -1 for down, 1 for up
      prevScrollRef.current = latest
      scrollRef.current = latest
    })
  }, [scrollYProgress])

  // Set initial colors
  useEffect(() => {
    if (mesh.current) {
      const colors = new Float32Array(count * 3)

      for (let i = 0; i < count; i++) {
        // Gradient colors from pink to purple to blue
        const r = 0.9 + Math.random() * 0.1 // Pink-ish
        const g = 0.2 + Math.random() * 0.4
        const b = 0.5 + Math.random() * 0.5

        colors[i * 3] = r
        colors[i * 3 + 1] = g
        colors[i * 3 + 2] = b
      }

      mesh.current.instanceColor = new THREE.InstancedBufferAttribute(colors, 3)
    }
  }, [count])

  useFrame((state, delta) => {
    if (!positions.length) return

    // Calculate iterations based on scroll direction and speed
    const scrollSpeed = Math.abs(scrollRef.current - prevScrollRef.current) * 10
    const iterations = 1 + Math.floor(scrollSpeed * 10) // More iterations when scrolling faster

    // Update positions based on Thomas attractor
    const newPositions = [...positions]

    for (let i = 0; i < count; i++) {
      let [x, y, z] = newPositions[i]

      // Apply Thomas attractor iterations based on scroll direction
      if (scrollDirectionRef.current > 0) {
        // Scrolling up - converge
        for (let j = 0; j < iterations; j++) {
          ;[x, y, z] = updateThomasAttractor(x, y, z, b, dt)
        }
      } else {
        // Scrolling down - diverge
        // When diverging, we move slightly toward initial positions
        const [ix, iy, iz] = initialPositions[i]
        x += (ix - x) * 0.01 * iterations
        y += (iy - y) * 0.01 * iterations
        z += (iz - z) * 0.01 * iterations
      }
      // Apply a small amount of attractor movement even when not scrolling
      ;[x, y, z] = updateThomasAttractor(x, y, z, b, dt * 0.5)

      // Keep positions within bounds
      x = Math.max(-5, Math.min(5, x))
      y = Math.max(-5, Math.min(5, y))
      z = Math.max(-5, Math.min(5, z))

      newPositions[i] = [x, y, z]

      // Set position
      dummy.position.set(x, y, z)

      // Set scale - make it smaller for better visualization
      const scale = 0.1 + Math.abs(x * y * z) * 0.01
      dummy.scale.set(0.05 + scale, 0.2 + scale, 0.05 + scale)

      // Set rotation based on position
      dummy.rotation.set(
        state.clock.elapsedTime * 0.1 + x,
        state.clock.elapsedTime * 0.2 + y,
        state.clock.elapsedTime * 0.1 + z,
      )

      dummy.updateMatrix()
      mesh.current.setMatrixAt(i, dummy.matrix)
    }

    setPositions(newPositions)
    mesh.current.instanceMatrix.needsUpdate = true
  })

  return (
    <instancedMesh ref={mesh} args={[undefined, undefined, count]}>
      <boxGeometry args={[1, 1, 1]} />
      <meshStandardMaterial />
    </instancedMesh>
  )
}

export default function ThomasAttractorScene() {
  return (
    <div className="w-full h-[400px] md:h-[500px] rounded-lg overflow-hidden">
      <Canvas camera={{ position: [0, 0, 8], fov: 50 }}>
        <ambientLight intensity={0.5} />
        <pointLight position={[10, 10, 10]} intensity={1} />
        <InstancedRectangles count={150} />
        <OrbitControls enableZoom={false} enablePan={false} />
      </Canvas>
    </div>
  )
}

