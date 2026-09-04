# Flujo semanal de trabajo

## Ramas

- Tarea grupal (BDD + API + UI): una rama por grupo, con el mismo nombre que su carpeta.
  - `grupo-01-cuentas-bancarias`, `grupo-02-tarjetas`, `grupo-03-prestamos`,
    `grupo-04-transferencias-pagos`, `grupo-05-ahorros-depositos`
- Entrega semanal individual: `semana-N/<apellido>`
  - Ejemplos: `semana-1/bernal`, `semana-3/coronel-avalos`

Nunca trabajar directamente sobre `main`.

## Entrega

1. Crear o actualizar la rama.
2. Implementar el avance de BDD, API o UI dentro de la carpeta del grupo.
3. Subir evidencias en `grupos/grupo-0N-modulo/evidence/`.
4. Abrir 1 PR por semana usando la plantilla del repo.
5. Describir en el PR qué escenarios quedaron cubiertos y qué falta.

## Objetivo por semana

### Semana 1
- análisis funcional del módulo (sección "Alcance" del README del grupo)
- BDD base: 3 escenarios en Gherkin (happy path, negativo, edge case)

### Semana 2
- API testing base: colección Postman del grupo con assertions

### Semana 3
- Newman, patrón SQL REST dinámico y evidencia de la corrida

### Semana 4
- Playwright: smoke del módulo con Page Objects

### Semana 5
- flujo integrado, CI verde y estabilización
