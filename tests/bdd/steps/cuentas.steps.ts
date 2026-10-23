
import { Given, When, Then } from '@cucumber/cucumber';
import { strict as assert } from 'node:assert';

let respuesta: Response;

const baseUrl = 'https://aiquaa-sandbox-api.vercel.app';

Given('que existe una API key valida del curso 2', function () {
  assert.ok(
    process.env.API_KEY,
    'Falta configurar la variable API_KEY'
  );
});

When('consulta la cuenta inexistente {int}', async function (id: number) {
  respuesta = await fetch(`${baseUrl}/api/v2/cuentas/${id}`, {
    headers: {
      'x-api-key': process.env.API_KEY!
    }
  });
});

Then('la API responde con estado {int}', function (codigo: number) {
  assert.equal(respuesta.status, codigo);
});
