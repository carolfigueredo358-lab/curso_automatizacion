// Perfiles de Cucumber.
//
// default : lo que corre `npm run test:bdd` y el CI. Excluye los .feature con tag @wip,
//           que son stubs sin step definitions todavia.
// wip     : dry-run de los stubs, para ver los snippets de los steps que faltan
//           (`npx cucumber-js -p wip`).
const paths = ['features/**/*.feature', 'grupos/**/features/**/*.feature'];
const require_ = ['tests/bdd/**/*.js'];

module.exports = {
  default: {
    paths,
    require: require_,
    tags: 'not @wip',
    format: ['progress', 'json:newman/cucumber-report.json'],
    formatOptions: { snippetInterface: 'async-await' },
  },
  wip: {
    paths,
    require: require_,
    tags: '@wip',
    dryRun: true,
    format: ['progress'],
    formatOptions: { snippetInterface: 'async-await' },
  },
};
