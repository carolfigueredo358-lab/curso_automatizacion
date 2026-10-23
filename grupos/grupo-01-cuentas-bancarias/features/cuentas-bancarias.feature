# language: es
@grupo-01
Característica: Cuentas bancarias
  Como cliente del banco
  quiero consultar mis cuentas, saldos y movimientos
  para controlar el estado de mi dinero 

  # Quitar el tag @wip cuando los steps estén implementados en tests/bdd/steps.

    @wip @happy-path
    Escenario: El cliente consulta el saldo de una cuenta activa
    Dado que el cliente tiene una cuenta activa
    Cuando consulta el detalle de esa cuenta
    Entonces el sistema devuelve el saldo y la moneda de la cuenta

  @wip @negativo
  Escenario: Consulta de una cuenta inexistente
    Dado que el cliente está autenticado
    Cuando consulta una cuenta que no existe
    Entonces el sistema responde que la cuenta no fue encontrada

  @edge-case
  Escenario: Cuenta sin movimientos registrados
    Dado que el cliente tiene una cuenta recién creada
    Cuando consulta los movimientos de esa cuenta
    Entonces el sistema devuelve una lista vacía sin error

    Escenario: Apertura de Cuentas en Guaranies
    Dado que el cliente aun no tiene cuenta
    Cuando ingresa a la app y solicita una cuenta en guaranies
    Entonces el sistema le genera un numero de cuenta de caja de ahorro

    Escenario: Consultar los movimientos de una cuenta bancaria
    Dado que el cliente posee una cuenta bancaria con movimientos registrados
    Cuando consulta los movimientos de la cuenta
    Entonces el sistema debe mostrar los movimientos asociados a la cuenta
    Y debe mostrar la información correspondiente a cada movimiento

    
  @RF-G1-02 @positivo
  Escenario: Apertura exitosa de una cuenta bancaria
    Dado que existe un cliente registrado
    Cuando solicita abrir una cuenta de ahorro en guaranies
    Entonces la API responde con codigo 201
    Y la cuenta se crea con saldo "0.00"
    Y el estado de la cuenta es "activa" 

    
  @RF-G1-03 @negativo
    Escenario: Consultar cuenta inexistente mediante API
    Dado que existe una API key valida del curso 2
    Cuando consulta la cuenta inexistente 999999999
    Entonces la API responde con estado 404


  @wip @RF-G1-06 @positivo
  Escenario: Bloquear una cuenta bancaria activa
    Dado que existe una cuenta bancaria activa
    Cuando solicita cambiar su estado a "bloqueada"
    Entonces la API responde con codigo 200
    Y el estado de la cuenta es "bloqueada"

  @wip @RF-G1-09 @negativo
    Escenario: Rechazar un retiro por saldo insuficiente
    Dado que existe una cuenta activa con saldo de 100000 guaranies
    Cuando solicita retirar 200000 guaranies
    Entonces la API responde con codigo 409
    Y el codigo de error es "CONFLICT"
    Y el saldo de la cuenta permanece sin cambios



