# Workflow de Planning

La fase de Planning se hace **una vez** al principio de tu proyecto. Acá es donde diseñás todo antes de escribir una sola línea de código.

> **Inversión de Tiempo**: ~1-3 horas para un proyecto típico
> **Beneficio**: Te ahorra semanas de refactoring y confusión después

## Resumen

Planning tiene **4 pasos core** que son obligatorios, más 3 pasos opcionales para necesidades específicas:

**Pasos Core (Requeridos)**:
1. PM crea el PRD (Product Requirements Document)
2. Architect diseña la arquitectura del sistema
3. PO valida la alineación entre PRD y Arquitectura
4. PO shardea los documentos en piezas manejables

**Pasos Opcionales**:
- Business Analyst crea project brief (para proyectos greenfield)
- UX Expert crea specs de diseño (para apps con mucha UI)
- QA hace risk profiling (para features de alto riesgo)

---

## Antes de Empezar

1. **Instalá droid**: Ejecutá `./setup.sh` en el directorio de tu proyecto
2. **Iniciá droid**: Ejecutá `droid` en tu terminal
3. **Tené tu idea lista**: Notas, bocetos, o simplemente tus pensamientos

---

## Paso Core 1: Product Manager - Crear PRD

**Agente**: Product Manager (`/pm`)
**Comando**: Primero `/pm` (mensaje 1), después `*create-prd` (mensaje 2)
**Input**: Tus notas del proyecto o descripción verbal
**Output**: `docs/prd.md`

### Qué Pasa

El PM te va a entrevistar sección por sección para crear un PRD completo:

1. **Project Overview**: Nombre, visión, objetivos
2. **Target Users**: ¿Quién va a usar esto?
3. **Features & Epics**: ¿Qué hace? (las stories son MUY breves - solo títulos)
4. **Requirements**: Funcionales y no funcionales
5. **MVP vs Roadmap**: ¿Qué va en fase 1? ¿Qué viene después?
6. **Success Metrics**: ¿Cómo medís el éxito?

### Cómo Ejecutar

**⚠️ IMPORTANTE**: Los comandos de agente se ejecutan en **dos mensajes separados**:
1. Primer mensaje: Activar el agente (ej: `/pm`)
2. Segundo mensaje: Dar la tarea (ej: `*create-prd`)

```bash
# Empezá fresco
/clear

# Mensaje 1: Activar el PM
/pm

# Mensaje 2: Dar la tarea (esperá a que el agente cargue)
*create-prd acá está mi idea: [pegá tus notas o describí verbalmente]

# Alternativa: Referenciar un archivo con tus notas
*create-prd @notas-iniciales.md
```

### Qué Hacés Vos

- **Respondé preguntas**: El PM te va a hacer preguntas para aclarar
- **Revisá cada sección**: Aprobá o pedí cambios antes de continuar
- **Mantené las stories breves**: En el PRD, las stories son solo títulos (ej: "Login de usuario con email")
- **Priorizá sin piedad**: ¿Qué es MVP? ¿Qué puede esperar?

### Criterios de Éxito

✅ PRD completo guardado en `docs/prd.md`
✅ Los features están claros y bien definidos
✅ Las stories son breves (los detalles completos vienen después del Scrum Master)
✅ El MVP está claramente separado del roadmap futuro

### Tips

- **Sé específico con el scope**: "Construir Instagram" es muy vago. "Construir app de fotos con filtros, comentarios y likes" es mejor
- **No te compliques con las stories todavía**: Solo títulos por ahora. El Scrum Master las va a expandir después
- **Enfocate en el POR QUÉ**: Ayudá al PM a entender el propósito, no solo los features

---

## Paso Core 2: Architect - Diseñar Arquitectura del Sistema

**Agente**: Architect (`/architect`)
**Comando**: Primero `/architect` (mensaje 1), después `*create-full-stack-architecture` (mensaje 2)
**Input**: `docs/prd.md`
**Output**: `docs/architecture.md`

### Qué Pasa

El Architect lee tu PRD y diseña el sistema técnico completo:

1. **Tech Stack**: Frontend, backend, base de datos, hosting
2. **Estructura de Código**: Layout de carpetas, organización de módulos
3. **APIs & Contratos**: Cómo se comunican los componentes
4. **Modelos de Datos**: Schema de base de datos, entidades, relaciones
5. **Non-Functional Requirements**: Seguridad, escalabilidad, performance
6. **Ambiente de Desarrollo**: Herramientas, CI/CD, estrategia de testing

### Cómo Ejecutar

```bash
# Empezá fresco
/clear

# Mensaje 1: Activar el Architect
/architect

# Mensaje 2: Dar la tarea (esperá a que el agente cargue)
*create-full-stack-architecture @docs/prd.md
```

### Qué Hacés Vos

- **Respondé preguntas de preferencias técnicas**: ¿React o Vue? ¿REST o GraphQL?
- **Revisá las decisiones de arquitectura**: El Architect te va a explicar trade-offs
- **Aprobá cada sección**: Asegurate de entender y estar de acuerdo con el diseño
- **Cuestioná si es necesario**: Si algo no tiene sentido, pedí alternativas

### Criterios de Éxito

✅ Arquitectura completa guardada en `docs/architecture.md`
✅ Tech stack está definido y justificado
✅ Estructura de carpetas está clara
✅ Contratos de API están documentados
✅ Modelos de datos se alinean con los features del PRD

### Tips

- **Aprovechá la expertise del Architect**: Si no sabés qué tech usar, pedí recomendaciones
- **Mantenelo simple**: No sobre-ingenierices. Un MVP no necesita microservicios
- **Pensá en tus skills**: Elegí tech que conocés o querés aprender
- **Considerá el deployment**: ¿Cómo vas a hostear esto? El Architect debería abordarlo

---

## Paso Core 3: Product Owner - Validar Alineación

**Agente**: Product Owner (`/po`)
**Comando**: Primero `/po` (mensaje 1), después `*validate-alignment` (mensaje 2)
**Input**: `docs/prd.md` y `docs/architecture.md`
**Output**: Reporte de validación (verbal o en notas)

### Qué Pasa

El PO actúa como quality gate, chequeando:

1. **Coherencia**: ¿La arquitectura realmente soporta todos los features del PRD?
2. **Viabilidad**: ¿El tech stack propuesto puede entregar los requirements?
3. **Completitud**: ¿Hay gaps o piezas faltantes?
4. **Contradicciones**: ¿Hay algo en la arquitectura que contradiga el PRD?

### Cómo Ejecutar

```bash
# Empezá fresco
/clear

# Mensaje 1: Activar el PO
/po

# Mensaje 2: Dar la tarea (esperá a que el agente cargue)
*validate-alignment @docs/prd.md @docs/architecture.md
```

### Qué Pasa Después

- **Si está alineado** ✅: El PO da luz verde, procedé al sharding
- **Si NO está alineado** ⚠️: El PO identifica issues, tenés que refinar documentos

### Arreglar Desalineación

Si el PO encuentra issues:

1. Volvé al agente relevante (PM o Architect)
2. Abordá los gaps/contradicciones
3. Re-ejecutá la validación
4. **No procedas hasta tener alineación completa**

### Criterios de Éxito

✅ PO confirma que PRD y Arquitectura están completamente alineados
✅ No hay features faltantes ni contradicciones
✅ Todos los requirements tienen un path de implementación claro

### Tips

- **Tomá esto en serio**: Desalineación ahora = refactoring mayor después
- **No te apures**: Vale la pena gastar 15 minutos acá para ahorrarte días de rework
- **Confiá en el PO**: Si marcan un issue, investigalo

---

## Paso Core 4: Product Owner - Shardear Documentos

**Agente**: Product Owner (`/po`)
**Comando**: Primero `/po` (mensaje 1), después `*shard-doc` (mensaje 2)
**Input**: `docs/prd.md` y `docs/architecture.md`
**Output**: Carpetas `docs/epics/` y `docs/stories/` con archivos shardeados

### Qué Pasa

El PO rompe documentos grandes en piezas pequeñas y enfocadas:

- **Shards del PRD** → Epics y Stories
- **Shards de Arquitectura** → Slices de arquitectura por epic

Cada shard es **<2K tokens** - suficientemente chico para que los agentes lo procesen perfectamente.

### Por Qué el Sharding es Crítico

Sin sharding:
- Developer recibe PRD de 10K tokens → degradación de contexto → bugs
- Las stories son muy grandes → difíciles de implementar → la calidad baja

Con sharding:
- Developer lee SOLO la story en la que está trabajando (2K tokens)
- El contexto del Architect está enfocado en el slice relevante de arquitectura
- Cada agente opera en el "sweet spot" de <5K tokens

### Cómo Ejecutar

```bash
# Empezá fresco
/clear

# Shardear el PRD
# Mensaje 1: Activar el PO
/po
# Mensaje 2: Dar la tarea (esperá a que el agente cargue)
*shard-doc docs/prd.md

# Shardear la Arquitectura
# Mensaje 1: Activar el PO
/po
# Mensaje 2: Dar la tarea (esperá a que el agente cargue)
*shard-doc docs/architecture.md
```

### Estructura del Output

Después del sharding, vas a tener:

```
docs/
├── prd.md                        # PRD original (guardalo para referencia)
├── architecture.md               # Arquitectura original (guardala para referencia)
├── epics/
│   ├── epic-1-autenticacion.md
│   ├── epic-2-dashboard.md
│   └── epic-3-configuracion.md
└── stories/
    ├── 1.1-login-email.md
    ├── 1.2-reset-password.md
    ├── 2.1-layout-dashboard.md
    └── 2.2-widgets-datos.md
```

### Criterios de Éxito

✅ Todos los epics están en `docs/epics/`
✅ Todas las stories están en `docs/stories/`
✅ Cada archivo es <2K tokens
✅ Las stories están numeradas secuencialmente y priorizadas
✅ Cada story es self-contained con el contexto necesario

### Tips

- **Revisá los shards**: Abrí algunas stories y asegurate de que tengan sentido
- **Numeración secuencial**: Las stories deberían estar ordenadas por prioridad (1.1, 1.2, 2.1, etc.)
- **Chequeá dependencias**: Si story 2.1 depende de 1.1, eso debería estar anotado
- **Guardá los originales**: No borres `prd.md` ni `architecture.md` - guardalos para referencia

---

## Pasos Opcionales

### Business Analyst - Crear Project Brief

**Cuándo usar**: Proyectos greenfield donde necesitás investigación de mercado y brief inicial

```bash
/analyst
*create-project-brief
```

El Business Analyst va a:
- Investigar el mercado y la competencia
- Definir audiencia objetivo y personas
- Crear un brief estratégico del proyecto
- Output: `docs/project-brief.md`

Después usá este brief como input para el PM.

---

### UX Expert - Crear Specs de Diseño

**Cuándo usar**: Apps con requirements significativos de UI/UX

```bash
/ux-expert
*create-front-end-spec @docs/prd.md @docs/architecture.md
```

El UX Expert va a:
- Diseñar la estructura de la interfaz de usuario
- Definir jerarquía de componentes
- Crear guidelines del design system
- Generar prompts para herramientas como V0/Lovable
- Output: `docs/ux-spec.md`

---

### QA - Risk Profiling

**Cuándo usar**: Proyectos de alto riesgo (seguridad, compliance, financiero)

```bash
/qa
*risk-profile @docs/prd.md @docs/architecture.md
```

El QA va a:
- Identificar áreas de alto riesgo
- Sugerir salvaguardas adicionales
- Recomendar estrategias de testing
- Output: Reporte de risk assessment

---

## Qué Tenés Después del Planning

Después de completar todos los pasos core, tenés:

✅ **PRD Completo** (`docs/prd.md`)
✅ **Arquitectura del Sistema** (`docs/architecture.md`)
✅ **Epics Shardeados** (`docs/epics/*.md`)
✅ **Stories Shardeadas** (`docs/stories/*.md`)
✅ **Backlog Priorizado** (stories numeradas secuencialmente)
✅ **Confirmación de Alineación** (PO validó todo)

**Cero líneas de código escritas.** Y eso es perfecto.

---

## Errores Comunes a Evitar

❌ **Saltarse la validación**: No te saltees el check de alineación del PO
❌ **Apurar el sharding**: Asegurate de que los shards sean realmente <2K tokens
❌ **Sobre-detallar stories en el PRD**: Mantené las stories como títulos breves - el SM las va a expandir después
❌ **Empezar a codear**: No empieces a codear hasta que el planning esté completo
❌ **Saltarse la arquitectura**: "Lo voy a resolver sobre la marcha" = receta para el desastre

---

## Próximos Pasos

¡Planning completo! Ahora movete al [Workflow de Development](./development-workflow.md) para empezar a construir tu proyecto story por story.

**Primer comando de desarrollo**:
```bash
/sm
*draft story 1.1
```
