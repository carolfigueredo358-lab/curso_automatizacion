# language: es
@wip @ejemplo
Característica: Ejemplo de formato Gherkin
  Este archivo es solo una muestra del formato esperado para los .feature del curso.
  Cada grupo escribe los suyos en grupos/grupo-0N-modulo/features/.

  Antecedentes:
    Dado que el cliente está autenticado en la banca web

  @happy-path
  Escenario: Consulta del saldo de una cuenta
    Dado que el cliente tiene una cuenta activa en guaraníes
    Cuando consulta el saldo de esa cuenta
    Entonces el sistema muestra el saldo disponible

  @negativo
  Esquema del escenario: Consulta con datos inválidos
    Cuando consulta la cuenta "<cuenta>"
    Entonces el sistema responde con el error "<error>"

    Ejemplos:
      | cuenta | error            |
      | 999999 | cuenta no existe |
      |        | dato requerido   |
