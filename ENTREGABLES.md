# Entregables del proyecto grupal

Cada equipo debe entregar como minimo:

## 1. Analisis y alcance

- objetivo del flujo automatizado
- supuestos
- riesgos
- cobertura incluida y excluida

(seccion "Alcance" del README de su grupo)

## 2. BDD

- al menos 3 escenarios en Gherkin, en la carpeta `features/` de su grupo
- 1 happy path
- 1 negativo
- 1 edge case
- steps implementados en `tests/bdd/` y el tag `@wip` removido del .feature

## 3. API

- coleccion Postman/Newman funcional en `postman/` de su grupo
- environment de ejecucion
- assertions basicas
- patron SQL REST dinamico (pre-request + post-response validando la base de datos) sobre al
  menos un endpoint de escritura del modulo propio — ver
  [`docs/TAREA-SQL-REST-DINAMICO.md`](docs/TAREA-SQL-REST-DINAMICO.md)

## 4. UI

- pruebas Playwright ejecutables en `tests/e2e/` de su grupo
- Page Objects propios que extienden `BasePage`
- selectores estables
- smoke flow minimo

## 5. Evidencias

- capturas o video
- salida de Newman
- evidencia de CI
- todo dentro de `evidence/` de su grupo

## 6. CI/CD

- workflow de PR o push verde
- ejecucion minima de checks

## 7. PR semanal

- 1 PR por semana por grupo
- descripcion clara del avance
- evidencias adjuntas

## 8. Documentacion final

- README del grupo actualizado (alcance, integrantes, escenarios entregados)
- pasos de ejecucion
- incidencias encontradas
- mejoras futuras
