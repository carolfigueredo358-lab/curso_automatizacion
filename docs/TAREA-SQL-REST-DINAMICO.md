# Tarea grupal — Patrón SQL REST dinámico en Postman

**Fecha límite: (definir fecha).**
**Entrega: 1 Pull Request por grupo** de su rama (`grupo-0N-modulo`) hacia `main` en este
repositorio, siguiendo el flujo de [`docs/FLUJO_SEMANAL.md`](./FLUJO_SEMANAL.md) y la plantilla
de PR del repo.

## Objetivo

Aplicar a un endpoint de escritura de **su propio módulo** el patrón de automatización
end-to-end que se explica en [`docs/patron-postman-pre-post-request.pdf`](./patron-postman-pre-post-request.pdf)
y que ya está implementado como ejemplo en la carpeta `E2E - Flujos con validación SQL` de
[`postman/aiquaa Sandbox API.json`](../postman/aiquaa%20Sandbox%20API.json).

En criollo: que el POST/PATCH/DELETE de su módulo no se dé por "probado" solo porque devolvió el
status code esperado — hay que **volver a consultar la base de datos** (vía
`/api/v1/sql/select`, de solo lectura) antes y después de la operación, para confirmar que
realmente pasó lo que tenía que pasar.

## Por qué esta tarea

Una colección con assertions solo sobre la respuesta HTTP (`pm.response.to.have.status(...)`,
algún `pm.expect(jsonData...)`) tiene **cero validación de base de datos**. Esta tarea agrega la
segunda mitad de lo que hace falta para decir que un endpoint está realmente probado: que la
operación quedó reflejada en la BD, no solo que la API respondió bien.

## Cómo funciona el patrón (resumen — el detalle completo está en el PDF)

1. **Pre-request Script de la COLECCIÓN** (ícono de la colección → pestaña *Scripts* →
   *Pre-request script*): se declara **una sola vez** el helper `utils.bodySqlRest(sql, params)`
   que arma la consulta a `/api/v1/sql/select`, y se resetean a su valor por defecto las
   variables de colección que arman el body de su request (una variable por cada campo que en
   algún caso va a variar — **no todo el body**, ver sección 3.2 del PDF).
2. **Body del request**: JSON normal y legible, con `{{variable}}` solo en el/los campo(s) que
   necesitan cambiar entre casos.
3. **Pre-request Script del request**: valida la precondición en la BD (¿existe el dato? ¿está
   en el estado esperado antes de mutarlo?) y, si el caso es negativo, sobreescribe **una sola
   variable** con el valor inválido.
4. **Tests Script (post-response)**: valida el status code y la forma de la respuesta, y hace un
   segundo `pm.sendRequest` con `utils.bodySqlRest(...)` para releer la BD y confirmar el
   INSERT/UPDATE — o, en un caso negativo, que un `COUNT(*)` no cambió.

## Qué endpoint le toca a cada grupo

| Grupo | Endpoint sugerido | Tabla afectada | Notas |
|---|---|---|---|
| 01 — Cuentas Bancarias | `POST /api/v1/movimientos` (o `POST /api/v1/cuentas`) | `movimientos` / `cuentas` | INSERT simple; caso negativo con un `cuentaId`/`usuarioId` inexistente (viola FK). |
| 02 — Tarjetas | `PATCH /api/v1/tarjetas/{id}/bloquear` (o `/activar`) | `tarjetas` (columna `estado`) | Verificar precondición: la tarjeta debe estar en el estado contrario antes de la acción. |
| 03 — Préstamos | *REST por publicar* — mientras tanto, un `UPDATE` sobre la tabla de cuotas vía `POST /api/v1/sql/update` | `prestamos` / `cuotas` | Aplicar el mismo patrón pre/post con el sandbox SQL: leer estado, mutar, releer. Migrar al endpoint REST cuando se publique. |
| 04 — Transferencias y Pagos | `POST /api/v1/transferencias` o `POST /api/v1/facturas/{id}/pagar` | `transferencias` / `facturas` + `pagos` | **Ya están resueltos como ejemplo completo** en la carpeta E2E. Estudien el ejemplo y agreguen un caso propio (ej. `cuentaOrigenId === cuentaDestinoId`, o pagar una factura ya `'pagada'` y confirmar que no se duplicó el pago). |
| 05 — Ahorros y Depósitos | *REST por publicar* — mientras tanto, `POST /api/v1/movimientos` sobre una cuenta de tipo `ahorro` | `movimientos` / `cuentas` | Mismo patrón: precondición de saldo, operación, relectura del saldo. |

Si su equipo ya viene automatizando otro endpoint de escritura de su propio módulo, pueden usar
ese en su lugar — lo importante es que sea una operación de escritura de **su** grupo, no de otro.

## Qué tienen que entregar

En la colección Postman de **su propio grupo** (dentro de `grupos/grupo-0N-modulo/postman/`):

- [ ] Pre-request Script de la colección con `utils.bodySqlRest` declarado una sola vez.
- [ ] Al menos un campo del body es `{{variable}}` — el resto del JSON queda igual de legible
      que un body fijo (no conviertan todo el body en una sola variable).
- [ ] **1 request "caso feliz"**: Pre-request valida la precondición en la BD; Test
      (post-response) valida el status esperado y relee la fila para confirmar el
      INSERT/UPDATE.
- [ ] **1 request "caso negativo"** (mínimo): sobreescribe una sola variable con un valor
      inválido; Test valida el status de rechazo y confirma — con `COUNT(*)` antes/después o
      releyendo el estado — que la base **no cambió**.
- [ ] Corre contra ids que existen realmente en la base del curso (no inventar ids).
- [ ] Evidencia de la corrida (captura del Postman Runner o salida de `newman run`) en la
      carpeta `evidence/` de su grupo.
- [ ] 1 Pull Request de su rama hacia `main`, con la descripción del avance (ver
      [`docs/FLUJO_SEMANAL.md`](./FLUJO_SEMANAL.md)).

Esto cuenta como parte de la sección **"3. API"** de [`ENTREGABLES.md`](../ENTREGABLES.md).

## Dudas

Cualquier duda puntual sobre una línea de script, compárenla contra los requests de la carpeta
`E2E - Flujos con validación SQL` en `postman/aiquaa Sandbox API.json` — los comentarios `//`
de esos scripts siguen la misma numeración de pasos que el PDF.
