# language: es
@wip @grupo-05
Característica: Ahorros y depósitos
  Como cliente del banco
  quiero gestionar mis depósitos a plazo
  para conocer tasas, plazos y vencimientos

  # Quitar el tag @wip cuando los steps estén implementados en tests/bdd/steps.

  @happy-path
  Escenario: El cliente consulta un depósito a plazo vigente
    Dado que el cliente tiene un depósito a plazo vigente
    Cuando consulta el detalle de ese depósito
    Entonces el sistema devuelve el capital, la tasa y la fecha de vencimiento

  @negativo
  Escenario: Depósito con importe menor al mínimo permitido
    Dado que el cliente tiene una cuenta de ahorro activa
    Cuando intenta constituir un depósito por debajo del importe mínimo
    Entonces el sistema rechaza la operación

  @edge-case
  Escenario: Depósito en su fecha de vencimiento
    Dado que el cliente tiene un depósito que vence hoy
    Cuando consulta el estado de ese depósito
    Entonces el sistema lo muestra como vencido y con los intereses acreditados
