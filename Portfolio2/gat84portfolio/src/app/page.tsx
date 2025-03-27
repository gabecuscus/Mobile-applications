import { Github, Linkedin, Mail, ExternalLink } from "lucide-react"
import Link from "next/link"
import { Button } from "@/components/ui/button"
import { Card, CardContent, CardDescription, CardFooter, CardHeader, CardTitle } from "@/components/ui/card"
import { Badge } from "@/components/ui/badge"
import ExpandingThomasAttractorScene from "@/components/expanding-thomas-attractor"

export default function Portfolio() {
  return (
    <div className="min-h-screen bg-gradient-to-br from-purple-50 to-white relative">
      {/* Header */}
      <header className="sticky top-0 z-40 w-full border-b bg-background/95 backdrop-blur supports-[backdrop-filter]:bg-background/60">
        <div className="container flex h-16 items-center justify-between">
          <div className="font-bold text-xl">Gabriel Torres</div>
          <nav className="hidden md:flex gap-6">
            <Link href="#about" className="text-muted-foreground hover:text-foreground transition-colors">
              About
            </Link>
            <Link href="#skills" className="text-muted-foreground hover:text-foreground transition-colors">
              Skills
            </Link>
            <Link href="#projects" className="text-muted-foreground hover:text-foreground transition-colors">
              Projects
            </Link>
          </nav>
          <div className="flex items-center gap-2">
            <Button variant="ghost" size="icon" asChild>
              <Link href="https://gabecuscus.github.io/WebGL_instancing/" target="_blank" rel="noopener noreferrer">
                <Github className="h-5 w-5" />
                <span className="sr-only">GitHub</span>
              </Link>
            </Button>
            <Button variant="ghost" size="icon" asChild>
              <Link href="https://www.linkedin.com/in/gabrieltorres25/" target="_blank" rel="noopener noreferrer">
                <Linkedin className="h-5 w-5" />
                <span className="sr-only">LinkedIn</span>
              </Link>
            </Button>
            <Button variant="ghost" size="icon" asChild>
              <Link href="mailto:john@example.com">
                <Mail className="h-5 w-5" />
                <span className="sr-only">Email</span>
              </Link>
            </Button>
          </div>
        </div>
      </header>

      <main className="container py-10 md:py-16 relative z-10">
        {/* Hero Section */}
        <section className="py-12 md:py-20 flex flex-col items-center text-center">
          <div className="w-full max-w-3xl mx-auto">
            <ExpandingThomasAttractorScene />
          </div>
          <h1 className="text-4xl md:text-6xl font-bold tracking-tight mb-4 bg-gradient-to-r from-pink-500 via-purple-400 to-blue-500 text-transparent bg-clip-text">
            Hi, I'm Gabriel Torres
          </h1>
          <p className="text-xl md:text-2xl text-muted-foreground max-w-2xl mb-8">
            Software artist blending technology with performance
          </p>
          <div className="flex gap-4">
            <Button
              className="bg-gradient-to-r from-pink-500 to-purple-500 hover:from-pink-600 hover:to-purple-600 border-0"
              asChild
            >
              <Link href="mailto:john@example.com">Get in touch</Link>
            </Button>
            <Button variant="outline" className="border-pink-500 text-pink-500 hover:bg-pink-50" asChild>
              <Link href="#projects">View my work</Link>
            </Button>
          </div>
        </section>

        {/* About Section */}
        <section id="about" className="py-12 md:py-20">
          <h2 className="text-3xl font-bold mb-8 text-center">About Me</h2>
          <div className="grid md:grid-cols-2 gap-10 items-center">
            <div className="aspect-square relative rounded-lg overflow-hidden bg-muted">
              <img src="/placeholder.svg?height=400&width=400" alt="Gabriel Torres" className="object-cover" />
            </div>
            <div>
              <p className="text-lg mb-4">
                I'm a Miami-based software artist blending technology with performance. My work spans interactive WebGL
                visuals, TouchDesigner environments, and scalable web applications.
              </p>
              <p className="text-lg mb-4">
                I've collaborated with symphonies and music venues like Nu Deco Ensemble to design responsive, real-time
                visuals that sync with live music.
              </p>
              <p className="text-lg mb-6">
                Now, I'm expanding my skills in web engineering — focusing on React, Node.js, and backend architecture —
                to bring immersive experiences to global audiences.
              </p>
              <Button variant="outline" className="border-pink-500 text-pink-500 hover:bg-pink-50" asChild>
                <Link href="/resume.pdf" target="_blank">
                  Download Resume
                </Link>
              </Button>
            </div>
          </div>
        </section>

        {/* Skills Section */}
        <section id="skills" className="py-12 md:py-20">
          <h2 className="text-3xl font-bold mb-8 text-center bg-gradient-to-r from-pink-500 via-purple-400 to-blue-500 text-transparent bg-clip-text">
            Skills & Technologies
          </h2>
          <div className="grid grid-cols-2 md:grid-cols-3 gap-6">
            <SkillCard title="Frontend" skills={["React", "TypeScript", "WebGL", "GLSL", "Tailwind", "ShadCN"]} />
            <SkillCard
              title="Creative Tech"
              skills={["TouchDesigner", "WebGL", "GLSL", "Interactive Visuals", "Real-time Graphics"]}
            />
            <SkillCard title="Backend & DevOps" skills={["Node.js", "AWS (learning)", "CI/CD (learning)"]} />
          </div>
        </section>

        {/* Projects Section */}
        <section id="projects" className="py-12 md:py-20">
          <h2 className="text-3xl font-bold mb-8 text-center bg-gradient-to-r from-pink-500 via-purple-400 to-blue-500 text-transparent bg-clip-text">
            Featured Projects
          </h2>
          <div className="grid md:grid-cols-2 lg:grid-cols-3 gap-6">
            <ProjectCard
              title="Nu Deco Ensemble Visuals"
              description="Interactive real-time visuals synchronized with live symphonic performances, creating immersive audiovisual experiences."
              tags={["WebGL", "TouchDesigner", "GLSL", "Real-time Graphics"]}
              image="https://hebbkx1anhila5yf.public.blob.vercel-storage.com/Screenshot%202025-03-27%20at%201.31.34%E2%80%AFPM-yzSNprpB5yPlQurjXkUfLFXA3AZkkO.png"
              demoUrl="https://gabecuscus.github.io/WebGL_instancing/"
              repoUrl="https://github.com"
            />
            <ProjectCard
              title="WebGL Attractors"
              description="Interactive 3D visualization of mathematical attractors using WebGL, creating mesmerizing patterns and forms."
              tags={["WebGL", "GLSL", "React", "Three.js"]}
              image="/placeholder.svg?height=200&width=300"
              demoUrl="https://gabecuscus.github.io/WebGL_instancing/"
              repoUrl="https://github.com"
            />
            <ProjectCard
              title="Interactive Performance System"
              description="A scalable web application for real-time interaction between performers and digital environments."
              tags={["React", "Node.js", "WebSockets", "TypeScript"]}
              image="/placeholder.svg?height=200&width=300"
              demoUrl="https://example.com"
              repoUrl="https://github.com"
            />
          </div>
        </section>
      </main>
    </div>
  )
}

function SkillCard({ title, skills }: { title: string; skills: string[] }) {
  return (
    <Card className="border-pink-200 hover:shadow-md hover:shadow-pink-100 transition-all bg-white/80 backdrop-blur-sm">
      <CardHeader>
        <CardTitle className="text-pink-500">{title}</CardTitle>
      </CardHeader>
      <CardContent>
        <div className="flex flex-wrap gap-2">
          {skills.map((skill) => (
            <Badge
              key={skill}
              variant="secondary"
              className="bg-gradient-to-r from-pink-100 to-purple-100 text-pink-700"
            >
              {skill}
            </Badge>
          ))}
        </div>
      </CardContent>
    </Card>
  )
}

function ProjectCard({
  title,
  description,
  tags,
  image,
  demoUrl,
  repoUrl,
}: {
  title: string
  description: string
  tags: string[]
  image: string
  demoUrl: string
  repoUrl: string
}) {
  return (
    <Card className="overflow-hidden border-pink-200 hover:shadow-md hover:shadow-pink-100 transition-all bg-white/80 backdrop-blur-sm">
      <div className="aspect-video relative">
        <img src={image || "/placeholder.svg"} alt={title} className="object-cover w-full h-full" />
      </div>
      <CardHeader>
        <CardTitle className="text-pink-500">{title}</CardTitle>
        <CardDescription>{description}</CardDescription>
      </CardHeader>
      <CardContent>
        <div className="flex flex-wrap gap-2 mb-4">
          {tags.map((tag) => (
            <Badge key={tag} variant="outline" className="border-pink-200 text-pink-500">
              {tag}
            </Badge>
          ))}
        </div>
      </CardContent>
      <CardFooter className="flex gap-2">
        <Button variant="outline" size="sm" className="w-full border-pink-200 text-pink-500 hover:bg-pink-50" asChild>
          <Link href={demoUrl} target="_blank" rel="noopener noreferrer">
            <ExternalLink className="h-4 w-4 mr-2" />
            Live Demo
          </Link>
        </Button>
        <Button variant="outline" size="sm" className="w-full border-pink-200 text-pink-500 hover:bg-pink-50" asChild>
          <Link href={repoUrl} target="_blank" rel="noopener noreferrer">
            <Github className="h-4 w-4 mr-2" />
            Code
          </Link>
        </Button>
      </CardFooter>
    </Card>
  )
}

