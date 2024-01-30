const esbuild = require('esbuild')

esbuild.build({
  entryPoints: ['app/javascript/application.js'],
  bundle: true,
  outdir: 'app/assets/builds',
  watch: process.argv.includes('--watch'),
  minify: process.env.NODE_ENV === 'production',
  sourcemap: process.env.NODE_ENV === 'development',
}).catch(() => process.exit(1))
