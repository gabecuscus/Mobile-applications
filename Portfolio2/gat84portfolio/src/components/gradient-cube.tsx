"use client"

import { useRef } from "react"
import { Canvas, useFrame } from "@react-three/fiber"
import { OrbitControls } from "@react-three/drei"
import type * as THREE from "three"

function GradientCube() {
  const meshRef = useRef<THREE.Mesh>(null!)
  const materialRef = useRef<THREE.ShaderMaterial>(null!)

  // Animation loop
  useFrame((state, delta) => {
    meshRef.current.rotation.x += delta * 0.3
    meshRef.current.rotation.y += delta * 0.4

    if (materialRef.current) {
      materialRef.current.uniforms.uTime.value += delta
    }
  })

  // Shader for gradient effect
  const vertexShader = `
    varying vec2 vUv;
    varying vec3 vPosition;
    
    void main() {
      vUv = uv;
      vPosition = position;
      gl_Position = projectionMatrix * modelViewMatrix * vec4(position, 1.0);
    }
  `

  const fragmentShader = `
    uniform float uTime;
    varying vec2 vUv;
    varying vec3 vPosition;
    
    void main() {
      // Create a gradient based on position and time
      vec3 color1 = vec3(0.93, 0.28, 0.6);  // Pink
      vec3 color2 = vec3(0.66, 0.33, 0.97); // Purple
      vec3 color3 = vec3(0.23, 0.51, 0.97); // Blue
      
      float noise = sin(vPosition.x * 5.0 + uTime) * 0.5 + 0.5;
      float noise2 = cos(vPosition.y * 5.0 + uTime * 0.8) * 0.5 + 0.5;
      
      vec3 colorA = mix(color1, color2, noise);
      vec3 finalColor = mix(colorA, color3, noise2);
      
      gl_FragColor = vec4(finalColor, 1.0);
    }
  `

  return (
    <mesh ref={meshRef}>
      <boxGeometry args={[2, 2, 2]} />
      <shaderMaterial
        ref={materialRef}
        vertexShader={vertexShader}
        fragmentShader={fragmentShader}
        uniforms={{
          uTime: { value: 0 },
        }}
      />
    </mesh>
  )
}

export default function GradientCubeScene() {
  return (
    <div className="w-full h-[300px] md:h-[400px] rounded-lg overflow-hidden">
      <Canvas>
        <ambientLight intensity={0.5} />
        <pointLight position={[10, 10, 10]} />
        <GradientCube />
        <OrbitControls enableZoom={false} />
      </Canvas>
    </div>
  )
}

