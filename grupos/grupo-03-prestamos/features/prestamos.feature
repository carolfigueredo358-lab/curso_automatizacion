# language: es
@wip @grupo-03
Característica: Préstamos
  Como cliente del banco
  quiero consultar mis préstamos y sus cuotas
  para saber cuánto debo y cuándo vence

  # Quitar el tag @wip cuando los steps estén implementados en tests/bdd/steps.

  @happy-path
  Escenario: El cliente consulta el saldo de un préstamo vigente
    Dado que el cliente tiene un préstamo vigente
    Cuando consulta el detalle de ese préstamo
    Entonces el sistema devuelve el saldo pendiente y la próxima cuota

  @negativo
  Escenario: Consulta de un préstamo de otro cliente
    Dado que el cliente está autenticado
    Cuando consulta un préstamo que no le pertenece
    Entonces el sistema rechaza la consulta

  @edge-case
  Escenario: Préstamo con todas las cuotas pagadas
    Dado que el cliente tiene un préstamo con todas sus cuotas pagadas
    Cuando consulta el detalle de ese préstamo
    Entonces el saldo pendiente es cero y el estado es cancelado
