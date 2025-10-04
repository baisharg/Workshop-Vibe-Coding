# Workflow de Development

La fase de Development es un **loop iterativo** que se repite para cada user story hasta que tu proyecto esté completo. Ejecutás este loop una vez por story.

> **Frecuencia**: Se repite para cada story en tu backlog
> **Duración**: 30 minutos a 2 horas por story (dependiendo de la complejidad)
> **Output**: Código funcional y testeado para cada feature

## Resumen

El Loop de Development tiene **7 pasos**:

1. **SM**: Revisar notas de la story anterior (loop de aprendizaje)
2. **SM**: Draftear la siguiente story con todos los detalles
3. **PO**: Validar el draft de la story contra el PRD
4. **Dev**: Implementar la story (código + tests)
5. **QA**: Testear exhaustivamente y proveer decisión de gate
6. **Dev**: Arreglar issues del review de QA
7. **Marcar como done** y volver al paso 1

Después del paso 7, volvés al **Paso 1** con la siguiente story. Y así hasta completar todo.

---

## Prerequisitos

Antes de empezar el Loop de Development, tenés que tener:

✅ Completado el [Workflow de Planning](./planning-workflow.md)
✅ PRD y Arquitectura en `docs/`
✅ Stories shardeadas en `docs/stories/`
✅ Stories priorizadas y numeradas secuencialmente

---

## Paso 1: Scrum Master - Revisar Notas Anteriores

**Agente**: Scrum Master (`/sm`)
**Comando**: `/sm *review-notes`
**Input**: Archivo de la story anterior (ej: `docs/stories/1.0.md`)
**Output**: Aprendizajes para aplicar a la siguiente story

### Qué Pasa

El Scrum Master revisa las notas de la story anterior:
- Qué funcionó bien
- Qué no funcionó
- Decisiones técnicas tomadas
- Feedback del Developer
- Feedback del QA
- Aprendizajes para aplicar a la siguiente story

### Cómo Ejecutar

```bash
# Empezá fresco
/clear

# Revisar notas de la story anterior
/sm
*review-notes @docs/stories/1.0.md
```

### Excepción de Primera Story

En tu **primera story** (ej: 1.1), no hay notas anteriores. Saltate este paso y andá directo al Paso 2.

### Criterios de Éxito

✅ SM revisó y entendió los aprendizajes anteriores
✅ SM tiene contexto para mejorar el siguiente draft de story

### Tips

- **Mejora continua**: Cada story debería ser mejor que la anterior
- **Buscá patrones**: Issues recurrentes deberían ser abordados
- **Anotá decisiones técnicas**: Si el Developer eligió una biblioteca específica, ese es contexto para stories futuras

---

## Paso 2: Scrum Master - Draftear la Siguiente Story

**Agente**: Scrum Master (`/sm`)
**Comando**: `/sm *draft story X.X`
**Input**:
- Epic de `docs/epics/`
- Slice de arquitectura relevante de `docs/architecture.md`
- Sección relevante del PRD de `docs/prd.md`
- Notas de la story anterior (del Paso 1)
**Output**: Draft detallado de la story en `docs/stories/X.X.md`

### Qué Pasa

El SM crea una story súper clara con:

1. **User Story**: "Como [usuario], quiero [feature], para que [beneficio]"
2. **Contexto**: ¿Cuál es el objetivo? ¿Cómo encaja esto en el panorama general?
3. **Tareas Secuenciales**: "Primero hacé esto, después esto, después esto"
4. **Criterios de Aceptación**: ¿Cómo sabemos que está hecho?
5. **Notas Técnicas**: Constraints de arquitectura, bibliotecas a usar, etc.
6. **Requirements de Testing**: ¿Qué tests se necesitan?

### Cómo Ejecutar

```bash
# Empezá fresco (o continuá del Paso 1)
/sm

# Después escribí el comando
*draft story 1.1

# O sé específico con referencia al epic
*draft story 1.1 @docs/epics/epic-1-autenticacion.md
```

### Qué Lee el SM

El SM va a leer SOLO:
- El epic relevante (no el PRD completo)
- El slice relevante de arquitectura (no toda la arquitectura)
- Notas de la story anterior (loop de aprendizaje)

**Contexto total**: <5K tokens. Precisión quirúrgica.

### Criterios de Éxito

✅ Draft de story guardado en `docs/stories/X.X.md`
✅ Las tareas son secuenciales y sin ambigüedades ("Primero X, después Y, después Z")
✅ Los criterios de aceptación son específicos y testeables
✅ El contexto técnico está incluido (arquitectura, bibliotecas, patrones)
✅ Los requirements de testing están claros

### Tips

- **Las tareas secuenciales son clave**: El Developer necesita "hacé esto, después esto" - no "arreglate"
- **Incluí edge cases**: "Manejá falla de login" no solo "implementá login"
- **Referenciá la arquitectura**: "Usá el patrón de auth de `docs/architecture.md` sección 3.2"
- **Mantenelo enfocado**: Una story = un feature o sub-feature

---

## Paso 3: Product Owner - Validar Draft de Story

**Agente**: Product Owner (`/po`)
**Comando**: `/po *validate story`
**Input**: Draft de story de `docs/stories/X.X.md`, PRD original
**Output**: Reporte de validación (aprobación o feedback)

### Qué Pasa

El PO actúa como quality gate:
- Verifica que la story se alinee con los requirements del PRD
- Asegura que todos los requirements estén cubiertos
- Identifica gaps o contradicciones
- Provee sugerencias de mejora

### Cómo Ejecutar

```bash
# Empezá fresco
/clear

# Validar el draft de la story
/po
*validate story @docs/stories/1.1.md
```

### Resultados Posibles

**✅ APROBADO**: La story está alineada con el PRD, lista para desarrollo

**⚠️ NECESITA REVISIÓN**: Se encontraron issues, volvé al SM para arreglar:
- Requirements faltantes
- Contradice el PRD
- Criterios de aceptación incompletos
- Las tareas no cubren todos los requirements

### Si Necesita Revisión

1. Anotá el feedback del PO
2. Volvé a `/sm` (Paso 2)
3. Revisá el draft de la story
4. Re-validá con `/po` (Paso 3)
5. **No procedas hasta estar aprobado**

### Criterios de Éxito

✅ PO aprueba el draft de la story
✅ La story se alinea completamente con los requirements del PRD
✅ Sin gaps ni contradicciones

### Tips

- **No te saltees esto**: La validación previene construir la cosa incorrecta
- **Tomá el feedback en serio**: Si el PO marca un issue, investigalo
- **Iterá si es necesario**: Mejor arreglar la story ahora que el código después

---

## Paso 4: Developer - Implementación

**Agente**: Developer (`/dev`)
**Comando**: `/dev *develop-story`
**Input**: Story aprobada de `docs/stories/X.X.md`
**Output**:
- Código de producción
- Tests unitarios
- Tests de integración
- Tests E2E (para user flows)
- Documentación de código

### Qué Pasa

El Developer implementa la story completamente:

1. **Lee la story**: Tareas, criterios de aceptación, notas técnicas
2. **Escribe código de producción**: Siguiendo arquitectura y patrones
3. **Escribe tests unitarios**: Para cada función/componente
4. **Escribe tests de integración**: Para interacciones entre componentes
5. **Escribe tests E2E**: Para user flows completos (usando Playwright si es web app)
6. **Documenta según sea necesario**: Comentarios inline, updates de README
7. **Toma notas**: Decisiones técnicas, blockers, aprendizajes

### Cómo Ejecutar

```bash
# Empezá fresco
/clear

# Desarrollar la story
/dev
*develop-story @docs/stories/1.1.md
```

### Qué Hace el Developer

El Developer sigue las **tareas secuenciales** de la story exactamente:
- Tarea 1: Crear componente de formulario de login
- Tarea 2: Agregar validación de formulario
- Tarea 3: Conectar al API de auth
- Tarea 4: Manejar estados de éxito/falla
- Tarea 5: Escribir tests

Cada tarea se completa en orden. Sin adivinar.

### Requirements de Testing

El Developer debe escribir:

**Tests Unitarios**:
- Testear funciones/componentes individuales en aislamiento
- Cubrir edge cases y manejo de errores
- Apuntar a alta coverage de lógica de negocio

**Tests de Integración**:
- Testear interacciones entre componentes
- Testear llamadas a API y flujo de datos
- Verificar manejo de estado

**Tests E2E** (para user flows):
- Testear journeys de usuario completos
- Usar Playwright MCP para web apps
- Cubrir paths críticos

### Criterios de Éxito

✅ Todas las tareas de la story están implementadas
✅ El código sigue arquitectura y patrones
✅ Todos los criterios de aceptación se cumplen
✅ Tests unitarios pasan
✅ Tests de integración pasan
✅ Tests E2E pasan
✅ El código está documentado
✅ El Developer documentó notas/decisiones

### Tips

- **Seguí la story exactamente**: El SM la planeó cuidadosamente
- **Testeá a medida que avanzás**: No escribas todo el código y después todos los tests
- **Documentá decisiones**: "Elegí biblioteca X porque Y" - esto ayuda a la siguiente story
- **Ejecutá tests frecuentemente**: Atrapá issues temprano
- **Usá Playwright MCP**: Para testing E2E web, está integrado en el setup

---

## Paso 5: QA - Testear Story Exhaustivamente

**Agente**: QA (`/qa`)
**Comando**: `/qa *review`
**Input**: Archivo de story, código implementado, tests
**Output**: Reporte de QA con decisión de gate

### Qué Pasa

El QA conduce un review comprehensivo:

1. **Ejecuta todos los tests**: Unitarios, integración, E2E
2. **Testing manual**: User flows, edge cases, escenarios de error
3. **Verificación de requirements**: ¿La implementación cumple los criterios de aceptación?
4. **Risk profiling**: ¿Issues de seguridad? ¿Problemas de performance?
5. **Calidad de código**: Best practices, mantenibilidad
6. **Decisión de gate**: PASS / CONCERNS / FAIL / WAIVED

### Cómo Ejecutar

```bash
# Empezá fresco
/clear

# Review de QA
/qa
*review @docs/stories/1.1.md
```

### Decisiones de Gate Explicadas

**PASS ✅**:
- Todos los tests pasan
- Requirements cumplidos
- Sin issues críticos
- La calidad de código es buena
- **Acción**: Procedé a marcar story como done

**CONCERNS ⚠️**:
- Se encontraron issues no críticos
- Bugs menores o issues de calidad
- Mejoras sugeridas pero no bloqueantes
- **Acción**: El equipo decide - arreglar ahora o aceptar y seguir adelante

**FAIL ❌**:
- Se encontraron issues críticos (seguridad, funcionalidad P0 rota)
- Tests fallando
- Requirements no cumplidos
- **Acción**: El Developer debe arreglar (ir al Paso 6)

**WAIVED 🔓**:
- Issues reconocidos y explícitamente aceptados por el equipo
- Usado cuando aceptás conscientemente technical debt
- **Acción**: Procedé pero documentá los issues waived

### Qué Chequea el QA

**Funcional**:
- ¿Todos los criterios de aceptación cumplidos?
- ¿Edge cases manejados?
- ¿Manejo de errores funcionando?

**Tests**:
- ¿Todos los tests pasan?
- ¿Coverage es adecuado?
- ¿Los tests son significativos (no solo 100% coverage de código trivial)?

**Calidad de Código**:
- ¿Sigue la arquitectura?
- ¿Consistente con el estilo del codebase?
- ¿Sin code smells obvios?

**Risk Assessment**:
- ¿Vulnerabilidades de seguridad?
- ¿Issues de performance?
- ¿Problemas de integridad de datos?

### Criterios de Éxito

✅ QA completó testing exhaustivo
✅ Decisión de gate fue provista
✅ Todos los issues están documentados

### Tips

- **QA es advisory**: Vos decidís tu barra de calidad
- **Para MVPs**: CONCERNS podrían ser aceptables
- **Para producción**: Solo PASS o WAIVED con entendimiento completo
- **No te saltees QA**: Incluso si el Developer dice "todos los tests pasan"

---

## Paso 6: Developer - Arreglar Según Review de QA

**Agente**: Developer (`/dev`)
**Comando**: Continuar en la misma sesión o `/dev` arreglar issues
**Input**: Reporte de QA del Paso 5
**Output**: Código y tests arreglados

### Qué Pasa

El Developer aborda el feedback de QA:
1. **Lee el reporte de QA**: Items FAIL y CONCERNS
2. **Arregla issues críticos**: Abordá todos los items FAIL
3. **Aborda CONCERNS**: Arreglá si hay tiempo, o discutí con el equipo
4. **Verifica fixes**: Ejecutá tests, asegurate de que no haya regresiones
5. **Re-somete a QA**: Si hubo items FAIL

### Cómo Ejecutar

```bash
# Continuar en la misma sesión de Developer
Arreglá los issues del review de QA @docs/stories/1.1.md

# O empezá fresco
/clear
/dev
Arreglá los issues del review de QA @docs/stories/1.1.md
```

### Loop de QA

Si QA dio **FAIL** ❌:
1. Developer arregla (Paso 6)
2. QA revisa nuevamente (Paso 5)
3. Repetir hasta PASS ✅ o WAIVED 🔓

Si QA dio **CONCERNS** ⚠️:
- Discutí con el equipo
- Decidí arreglar ahora o aceptar
- Si arreglás: Developer arregla, QA re-revisa
- Si aceptás: Waive y documentá

Si QA dio **PASS** ✅:
- Saltate este paso, andá al Paso 7

### Criterios de Éxito

✅ Todos los items FAIL abordados
✅ CONCERNS abordados o explícitamente waived
✅ Tests pasan
✅ QA aprueba (PASS o WAIVED)

### Tips

- **No discutas con QA**: Si encontraron un issue, probablemente sea real
- **Arreglá exhaustivamente**: No parchees nomás - arreglá la causa raíz
- **Aprendé de esto**: ¿Por qué QA atrapó esto? ¿Cómo puede la siguiente story evitarlo?

---

## Paso 7: Marcar Como Done & Siguiente Story

**Agente**: Vos (humano)
**Comando**: N/A (proceso manual)
**Input**: Story completada
**Output**: Story marcada como done, listo para la siguiente iteración

### Qué Pasa

Marcás la story como completa y te preparás para la siguiente:

1. **Actualizar backlog**: Marcar story X.X como DONE
2. **Commitear código**: `git add . && git commit -m "Story X.X: [descripción]"`
3. **Revisar backlog**: ¿Qué sigue?
4. **Empezar loop nuevamente**: Ir al Paso 1 con la siguiente story

### Tracking Manual vs. Automatizado

Podés trackear stories en:
- Un simple markdown checklist en `docs/backlog.md`
- Un GitHub Project board
- Trello / Linear / Jira
- Papel y lápiz

Elegí lo que te funcione.

### Criterios de Éxito

✅ Story marcada como done
✅ Código commiteado
✅ Siguiente story identificada
✅ Listo para volver al Paso 1

---

## El Loop Continúa

Después del Paso 7, volvé al **Paso 1** con la siguiente story:

```
Story 1.1 Done → Paso 1 (revisar notas de 1.1) → Paso 2 (draft 1.2) → ... → Story 1.2 Done → ...
```

Repetí hasta que todas las stories estén completas. Después tu proyecto está listo.

---

## Principios Clave para el Éxito

### 1. Confiá en el Proceso

Cada paso de validación (PO, QA) atrapa issues temprano. No te los saltees.

### 2. Human in the Loop

Vos aprobás las transiciones clave:
- Después de que SM draftea story (revisá antes de pasarle al Dev)
- Después de que PO valida (confirmá alineación)
- Después de que QA revisa (aceptá la decisión de gate)

### 3. Ejecución Secuencial

No intentes hacer múltiples stories en paralelo. Una story a la vez, completamente hecha.

### 4. Mejora Continua

El loop aprende de sí mismo:
- Las notas de Story N informan el draft de Story N+1
- Emergen patrones
- La calidad mejora

### 5. Barra de Calidad Flexible

Vos elegís:
- **Modo MVP**: Aceptá CONCERNS, movete rápido
- **Modo Producción**: Solo PASS o WAIVEDs completamente entendidos

---

## Errores Comunes a Evitar

❌ **Saltarse validación de PO**: "Voy a confiar en el SM" - después Dev construye la cosa incorrecta
❌ **Saltarse review de QA**: "Los tests pasan, shippeá" - después los usuarios encuentran bugs
❌ **Apurar fixes**: QA encontró issues, Dev parchea rápido sin entender la causa raíz
❌ **Trabajar en múltiples stories**: Enfocate en una story a la vez
❌ **No documentar notas**: Las stories futuras pierden contexto de aprendizaje

---

## Tips Avanzados

### Cuándo Romper una Story

Si un draft de story es **>3K tokens**, es muy grande. Volvé a `/po` y shardeala más.

### Cuándo Refactorizar

Si notás el mismo patrón de código en 3+ stories, es una señal para refactorizar:
- Creá un componente/utility reutilizable
- Actualizá los docs de arquitectura
- Las stories futuras usan el nuevo patrón

### Cuándo Saltarse Tests

Respuesta corta: **No lo hagas.**

Respuesta larga: Para prototipos descartables, podrías saltarte tests E2E. Pero tests unitarios y de integración son no negociables para código de producción.

### Cuándo Usar UX Expert a Mitad de Development

Si una story necesita UI compleja que no se especificó en planning:

```bash
/ux-expert
Diseñá el UI para [feature] @docs/stories/X.X.md
```

El UX Expert puede generar prompts de V0/Lovable para creación rápida de UI.

---

## Monitoreando Progreso

Trackeá tu velocidad:
- ¿Cuántas stories por día?
- ¿Qué tipos de stories son más rápidas?
- ¿Dónde ocurren la mayoría de los issues de QA?

Usá estos datos para mejorar tu planning y sharding.

---

## Cómo Se Ve el Éxito

Después de cada story:
✅ El feature está implementado y funcionando
✅ Los tests pasan
✅ El código está commiteado
✅ Quality gate pasó (PASS o WAIVED)
✅ Notas documentadas para la siguiente story

Después de todas las stories:
✅ El proyecto está completo
✅ El código está testeado
✅ Todo funciona end-to-end
✅ Listo para deployar

---

## Próximos Pasos

Ya estás equipado para ejecutar el Loop de Development. Acordate:

1. Empezá con `Story 1.1`
2. Seguí los 7 pasos
3. Volvé al Paso 1 para `Story 1.2`
4. Repetí hasta completar

**Primer comando**:
```bash
/sm
*review-notes
```
(o saltate a `/sm` y después `*draft story 1.1` si es tu primera story)

¡Suerte construyendo!
