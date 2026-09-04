# Grupo 03 — Préstamos

**Módulo:** Préstamos, cuotas, saldo, vencimientos y estado
**Rama / carpeta:** `grupo-03-prestamos`

> **Nota:** los endpoints REST de préstamos **todavía no están publicados** en la sandbox API.
> Arranquen por BDD + validación SQL (sandbox `/api/v1/sql/*` y acceso directo a la DB) y sumen
> la capa REST en cuanto salgan. Verificar disponibilidad con `GET /api/v1/docs`.

## Integrantes

Máximo 3. Completar con nombre y email (ver [`docs/ROSTER.md`](../../docs/ROSTER.md)):

| # | Nombre y apellido | Email |
|---|---|---|
| 1 |  |  |
| 2 |  |  |
| 3 |  |  |

## Alcance

Completar antes de escribir el primer escenario:

- **Objetivo:**
- **Supuestos:**
- **Riesgos:**
- **Cobertura incluida:**
- **Cobertura excluida:**

## API y datos

| Capa | Recursos |
|---|---|
| REST | *por publicar* — revisar `GET /api/v1/docs` |
| SQL sandbox | `POST /api/v1/sql/select`, `POST /api/v1/sql/update` sobre `prestamos` y `cuotas` (nombres a confirmar contra la DB) |
| DB directa | usuario `qa_g03` — ver [`docs/ACCESO-DB.md`](../../docs/ACCESO-DB.md) |

Primer paso sugerido: listar las tablas del módulo con un `SELECT` contra la DB y documentar el
modelo de datos real en este README antes de escribir escenarios.

## Entregables

Checklist según [ENTREGABLES.md](../../ENTREGABLES.md):

- [ ] Análisis y alcance (sección de arriba completa)
- [ ] BDD — `features/prestamos.feature` (happy path, negativo y edge case)
- [ ] API — colección Postman/Newman en `postman/` + patrón SQL REST dinámico
- [ ] UI — `tests/e2e/prestamos.spec.ts` con Playwright
- [ ] Evidencias en `evidence/`
- [ ] CI/CD verde
- [ ] PR de `grupo-03-prestamos` hacia `main` usando la plantilla del repo
