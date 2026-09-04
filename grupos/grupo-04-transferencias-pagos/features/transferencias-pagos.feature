# language: es
@wip @grupo-04
Característica: Transferencias y pagos
  Como cliente del banco
  quiero transferir dinero y pagar facturas
  para cumplir con mis obligaciones

  # Quitar el tag @wip cuando los steps estén implementados en tests/bdd/steps.

  @happy-path
  Escenario: Transferencia entre cuentas propias
    Dado que el cliente tiene dos cuentas activas con saldo suficiente
    Cuando transfiere un importe válido de una cuenta a la otra
    Entonces la transferencia queda registrada en estado exitoso

  @negativo
  Escenario: Transferencia con la misma cuenta de origen y destino
    Dado que el cliente tiene una cuenta activa
    Cuando intenta transferir a esa misma cuenta
    Entonces el sistema rechaza la operación y no registra la transferencia

  @edge-case
  Escenario: Pago de una factura ya pagada
    Dado que existe una factura en estado pagada
    Cuando el cliente intenta pagarla de nuevo
    Entonces el sistema rechaza el pago y no se duplica el registro
