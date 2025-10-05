# BMAD Method - Workshop de Agentic Coding

Bienvenido al repositorio del workshop de Agentic Coding. Este repo contiene todo lo que necesitás para construir proyectos de software completos usando agentic coding con AI.

## ¿Qué es BMAD?

**BMAD** es un método de desarrollo de software que usa 8 agentes de AI especializados para construir aplicaciones listas para producción. En lugar de tirar todo en un solo chat de AI, BMAD mantiene cada agente enfocado con contexto quirúrgico (<5K tokens) para mantener 96%+ de precisión.

### El Problema que BMAD Resuelve

El coding tradicional con AI se degrada después de ~10K tokens. Empezás con resultados increíbles, después te chocás con la pared:
- El contexto se infla
- La AI olvida decisiones anteriores
- La calidad del código baja
- El refactoring se vuelve necesario

### La Solución BMAD

Tres principios fundamentales:
1. **Contexto Quirúrgico**: Cada agente recibe SOLO lo que necesita (<5K tokens)
2. **Agentes Especializados**: 8 agentes con roles específicos (PM, Architect, Developer, QA, etc.)
3. **Planning Estructurado**: Planning completo antes de codear - PRD, arquitectura, stories

BMAD viene pre instalado en este repo. El repo original es https://github.com/bmad-code-org/bmad-method/

## Setup

### 1. Forkeá este Repositorio

Primero, forkeá este repositorio a tu cuenta de GitHub para tener tu propia copia.

### 2. Elegí tu Entorno de Desarrollo

Tenés dos opciones:

**Opción A: Instalación Local**
- Cloná tu fork y trabajá en tu computadora
- Requiere tener instalado: Node.js, npm/npx

**Opción B: GitHub Codespaces (Recomendado para empezar)**
- 120 horas gratis por mes
- VM con 4 cores y 16GB RAM
- Todo pre-configurado, sin instalación local
- Click en "Code" → "Codespaces" → "Create codespace on main"

### 3. Instalá las Dependencias

Ejecutá el script de setup para instalar droid CLI (un agente de terminal gratis) y las dependencias necesarias:

```bash
./setup.sh
```

Después del setup, iniciá droid para configurar los servidores MCP:

```bash
droid
```

Una vez en droid, agregá los servidores MCP necesarios:

```bash
/mcp add sequential-thinking "npx -y @modelcontextprotocol/server-sequential-thinking"
/mcp add playwright "npx @playwright/mcp@latest"
```

¡Listo! Ya podés empezar a usar BMAD.

## Cómo Usar BMAD con Droid

BMAD tiene dos fases principales: **Planning** (se hace una vez) y **Development** (loop iterativo).

### Comandos Quick Start

En droid, invocás los agentes en dos pasos:

1. **Ejecutá el comando del agente**: `/pm`, `/architect`, `/dev`, etc.
2. **Escribí el comando específico**: Una vez que el agente carga, escribís el comando (ej: `*create-prd`)

**⚠️ IMPORTANTE**: Usá `/new` para limpiar el contexto antes de cambiar de agente. Esto asegura que cada agente reciba solo el contexto quirúrgico que necesita.

Ejemplos:

```bash
# Fase de planning
/pm
*create-prd
# Conversacion con Product Manager sobre detalles del producto...

/new              # Limpiá el contexto antes de cambiar de agente
/architect
*create-full-stack-architecture
# Conversacion con el Architect sobre detalles de la arquitectura...

/new
/po
*shard-doc @docs/prd.md and @docs/architecture.md
*execute-checklist-po

# Loop de desarrollo
/new
/sm
*draft story 1.1

/new
/po
*validate story @docs/stories/1.1.md

/new
/dev
*develop-story @docs/stories/1.1.md

/new
/qa
*review @docs/stories/1.1.md
```

### Los 8 Agentes

Cada agente es el mismo LLM (Claude/GPT) con prompts especializados y contexto enfocado:

1. **📊 Business Analyst** - `/analyst` - Crea briefs de proyecto e investigación de mercado
2. **📋 Product Manager** - `/pm` - Crea PRDs, define features y requirements
3. **🏗️ Architect** - `/architect` - Diseña la arquitectura del sistema y tech stack
4. **🎨 UX Expert** - `/ux-expert` - Crea specs de UI/UX y sistemas de diseño
5. **📝 Product Owner** - `/po` - Shardea documentos, valida alineación, maneja el backlog
6. **🏃 Scrum Master** - `/sm` - Crea user stories detalladas con criterios de aceptación
7. **💻 Developer** - `/dev` - Implementa código, tests y documentación
8. **🧪 QA** - `/qa` - Revisa calidad de código, ejecuta tests, da decisiones de quality gate

## Estructura del Repositorio

Después de ejecutar BMAD, tu proyecto va a tener esta estructura:

```
proyecto/
├── .bmad-core/                   # Archivos del método BMAD (agentes, tasks, prompts)
├── docs/
│   ├── prd.md                    # Product Requirements Document
│   ├── architecture.md           # Arquitectura del Sistema
│   ├── prd/                      # Shards del PRD
│   │   ├── auth.md
│   │   ├── dashboard.md
│   │   └── epic-1.md
│   ├── architecture/             # Shards de arquitectura
│   │   ├── shard-1-backend.md
│   │   └── shard-2-frontend.md
│   └── stories/                  # Dev stories
│       ├── 1.1.md
│       └── 1.2.md
├── src/                          # Código de tu aplicación (estructura depende del tipo de proyecto)
└── tests/                        # Archivos de tests (estructura depende del tipo de proyecto)
```

## Workflows

Para instrucciones paso a paso detalladas, mirá:

- **[Workflow de Planning](./planning-workflow.md)** - Fase de planning completa (se hace una vez al inicio del proyecto)
- **[Workflow de Development](./development-workflow.md)** - Loop de desarrollo iterativo (se repite para cada story)

## Principios Clave

### Contexto Quirúrgico
Nunca cargues más de 5K tokens por agente. El PO shardea documentos grandes en piezas pequeñas y enfocadas.

### Tareas Secuenciales
Cada story tiene instrucciones claras de "hacé esto, después esto". Sin ambigüedades.

### Human in the Loop
Vos aprobás las transiciones clave. Sos el tech lead guiando al equipo de AI.

### Quality Gates
QA provee decisiones de gate: PASS ✅ / CONCERNS ⚠️ / FAIL ❌ / WAIVED 🔓

## Recursos

- **Repositorio GitHub**: [github.com/bmad-code-org/bmad-method](https://github.com/bmad-code-org/bmad-method)
- **Tutorial en Video**: [youtu.be/LorEJPrALcg](https://youtu.be/LorEJPrALcg)
- **Comunidad WhatsApp**: [Unite al grupo "Agentic Coding"](https://chat.whatsapp.com/IpVPWqa5gcM9ePJRgTMUPM)

## Tips para el Éxito

1. **No te saltees el planning**: Completá PRD → Arquitectura → Sharding antes de cualquier código
2. **Confiá en el proceso**: Los pasos de validación (PO, QA) atrapan issues temprano
3. **Limpiá el contexto entre agentes**: Usá `/clear` o `/new` cuando cambies de agente

**¿Listo para empezar?** Ejecutá `./setup.sh` y después seguí el [Workflow de Planning](./planning-workflow.md) para crear tu primer proyecto BMAD.
