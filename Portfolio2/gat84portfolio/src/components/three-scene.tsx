"use client"

import { useRef } from "react"
import { Canvas, useFrame } from "@react-three/fiber"
import { OrbitControls } from "@react-three/drei"
import type * as THREE from "three"

function Cube() {
  const meshRef = useRef<THREE.Mesh>(null!)

  // Animation loop
  useFrame((state, delta) => {
    meshRef.current.rotation.x += delta * 0.5
    meshRef.current.rotation.y += delta * 0.2
  })

  return (
    <mesh ref={meshRef}>
      <boxGeometry args={[2, 2, 2]} />
      <meshStandardMaterial color="#ec4899" />
    </mesh>
  )
}

export default function ThreeScene() {
  return (
    <div className="w-full h-[300px] md:h-[400px] rounded-lg overflow-hidden">
      <Canvas>
        <ambientLight intensity={0.5} />
        <pointLight position={[10, 10, 10]} />
        <Cube />
        <OrbitControls enableZoom={false} />
      </Canvas>
    </div>
  )
}

