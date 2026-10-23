# Grupo 01 — Cuentas Bancarias

**Módulo:** Cuentas, saldos, estados y movimientos
**Rama / carpeta:** `grupo-01-cuentas-bancarias`

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
| REST | `GET /api/v1/cuentas?usuarioId=`, `POST /api/v1/cuentas`, `GET|PUT|DELETE /api/v1/cuentas/{id}`, `GET|POST /api/v1/movimientos`, `GET /api/v1/movimientos/{id}` |
| SQL sandbox | `POST /api/v1/sql/select`, `POST /api/v1/sql/update` sobre `cuentas` y `movimientos` |
| DB directa | usuario `qa_g01` — ver [`docs/ACCESO-DB.md`](../../docs/ACCESO-DB.md) |

Detalle de campos y estados: `GET /api/v1/docs` y [`docs/API-SANDBOX.md`](../../docs/API-SANDBOX.md).

## Entregables

Checklist según [ENTREGABLES.md](../../ENTREGABLES.md):

- [ ] Análisis y alcance (sección de arriba completa)
- [ ] BDD — `features/cuentas-bancarias.feature` (happy path, negativo y edge case)
- [ ] API — colección Postman/Newman en `postman/` + patrón SQL REST dinámico
- [ ] UI — `tests/e2e/cuentas-bancarias.spec.ts` con Playwright
- [ ] Evidencias en `evidence/`
- [ ] CI/CD verde
- [ ] PR de `grupo-01-cuentas-bancarias` hacia `main` usando la plantilla del repo


## Mejora de BDD - Grupo 1

### Objetivo
Mejorar los escenarios de pruebas funcionales del módulo
Cuentas Bancarias utilizando BDD y lenguaje Gherkin.

### Documento de referencia
Requerimientos funcionales del Grupo 1:
grupo-01-cuentas-bancarias.pdf

### Funcionalidades analizadas
- Listado y consulta de cuentas bancarias.
- Apertura y modificación de cuentas.
- Baja lógica de cuentas.
- Bloqueo y desbloqueo de cuentas.
- Consulta de saldos y movimientos.
- Registro de depósitos y retiros.
- Validación de errores y reglas de negocio.

### Escenarios BDD incorporados
Se agregaron escenarios para:
- Apertura exitosa de una cuenta.
- Bloqueo de una cuenta activa.
- Rechazo de retiro por saldo insuficiente.

Archivo:
features/cuentas-bancarias.feature

### Documentación y extracción de texto
El PDF de requerimientos contiene texto seleccionable,
por lo que puede convertirse a Markdown sin aplicar
OCR sobre imágenes.

La extracción permite identificar requerimientos,
reglas de negocio y criterios de aceptación para
elaborar los escenarios Gherkin.

### Estado de las pruebas
Los escenarios agregados están documentados.
Pendiente: verificar las definiciones de pasos,
ejecutar las pruebas y registrar las evidencias.

