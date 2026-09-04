# Acceso a la base de datos de pruebas

Base Postgres (Supabase) del entorno de práctica. Cada grupo tiene su propio usuario.

| Parámetro | Valor |
|---|---|
| Host | `db.hocryhxndegslzfiwlnx.supabase.co` |
| Puerto | `5432` |
| Base de datos | `postgres` |

| Grupo | Módulo | Usuario | Password |
|---|---|---|---|
| 01 | Cuentas Bancarias | `qa_g01` | *(solicitar al docente)* |
| 02 | Tarjetas | `qa_g02` | *(solicitar al docente)* |
| 03 | Préstamos | `qa_g03` | *(solicitar al docente)* |
| 04 | Transferencias y Pagos | `qa_g04` | *(solicitar al docente)* |
| 05 | Ahorros y Depósitos | `qa_g05` | *(solicitar al docente)* |

> Las passwords **no se publican en este repositorio**. Se entregan por el canal del curso.
> Nunca commitear credenciales: el `.env` está en `.gitignore`.

## Configurar el `.env`

```bash
cp .env.example .env
```

Completar el bloque de base de datos con el usuario y la password de su grupo:

```
PGHOST=db.hocryhxndegslzfiwlnx.supabase.co
PGPORT=5432
PGDATABASE=postgres
PGUSER=qa_g0N
PGPASSWORD=<la password de su grupo>
```

## Conectarse

Con `psql`:

```bash
psql "postgresql://qa_g0N@db.hocryhxndegslzfiwlnx.supabase.co:5432/postgres"
```

Con DBeaver / pgAdmin / TablePlus: mismos host, puerto, base, usuario y password. SSL requerido
(modo `require`).

## Para qué se usa

- Explorar el modelo de datos del módulo antes de escribir escenarios.
- Preparar y verificar precondiciones de los casos de prueba.
- Validar en la base que un `POST`/`PATCH`/`DELETE` de la API realmente impactó, siguiendo el
  patrón de [`TAREA-SQL-REST-DINAMICO.md`](./TAREA-SQL-REST-DINAMICO.md).

Desde Postman/Newman no se usa esta conexión directa: se usa el sandbox SQL de la API
(`POST /api/v1/sql/select`, `POST /api/v1/sql/update`) — ver [`API-SANDBOX.md`](./API-SANDBOX.md).
