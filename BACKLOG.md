# Backlog base del curso

Ideas de cobertura por modulo. Cada grupo toma las de su epica, las refina y agrega las propias.

## Epic 1 - Cuentas Bancarias (grupo 01)

- Listar cuentas de un usuario
- Consultar detalle y saldo de una cuenta
- Consultar movimientos de una cuenta
- Cuenta inexistente / cuenta de otro usuario
- Cuenta sin movimientos

## Epic 2 - Tarjetas (grupo 02)

- Listar tarjetas del cliente
- Bloquear tarjeta activa
- Activar tarjeta bloqueada
- Bloquear una tarjeta ya bloqueada (negativo)
- Limite disponible y tarjeta vencida

## Epic 3 - Prestamos (grupo 03)

- Consultar prestamos vigentes
- Detalle de cuotas y proximo vencimiento
- Saldo pendiente tras un pago
- Prestamo cancelado (todas las cuotas pagadas)
- Prestamo de otro cliente (negativo)

## Epic 4 - Transferencias y Pagos (grupo 04)

- Transferencia entre cuentas propias
- Transferencia a beneficiario registrado
- Importe mayor al saldo disponible (negativo)
- Cuenta origen igual a cuenta destino (negativo)
- Pago de factura pendiente y reintento sobre factura ya pagada

## Epic 5 - Ahorros y Depositos (grupo 05)

- Constituir un deposito a plazo
- Consultar tasa, plazo y fecha de vencimiento
- Importe por debajo del minimo (negativo)
- Deposito que vence hoy (edge case)
- Acreditacion de intereses al vencimiento

## Epic 6 - Evidencia

- Guardar capturas y videos de cada corrida
- Exportar salida de Newman
- Documentar defectos encontrados con la plantilla de bug report

## Epic 7 - CI

- Job de BDD verde
- Job de smoke UI verde
- Ejecucion de Newman con la coleccion del grupo
