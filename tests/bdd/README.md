# BDD workspace

Aca van los step definitions y el soporte de Cucumber que escribe cada grupo.

Estructura sugerida:

- `tests/bdd/steps/` — steps por capa (api, web, db)
- `tests/bdd/support/` — hooks y world

## Como se descubren

[`cucumber.js`](../../cucumber.js) carga `tests/bdd/**/*.js` y corre los `.feature` de
`features/` y de `grupos/**/features/`, **excluyendo los que tienen el tag `@wip`**.

Flujo para poner en verde un feature:

1. Escribir los escenarios en `grupos/grupo-0N-modulo/features/<modulo>.feature`.
2. Implementar los steps en `tests/bdd/steps/<modulo>.steps.js`.
3. Quitar el tag `@wip` del `.feature`.
4. `npm run test:bdd`.

Para ver los snippets de los steps que faltan, sin filtrar por tag:

```bash
npx cucumber-js -p wip
```

## Steps en TypeScript

Si el grupo prefiere TypeScript, instalar `ts-node` y agregar a `cucumber.js`:

```js
requireModule: ['ts-node/register'],
require: ['tests/bdd/**/*.ts'],
```
