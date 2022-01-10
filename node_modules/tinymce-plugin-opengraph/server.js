const webpack = require('webpack')
const middleware = require('webpack-dev-middleware')
const webpackConfig = require('./webpack.config')
const handlebars = require('express-handlebars')
const fetcher = require('opengraph-fetcher')
const express = require('express')
const app = express()
const config = webpackConfig(process.env, { mode: 'development' })


app.engine('hbs', handlebars({
  defaultLayout: 'main.hbs'
}));
app.set('view engine', 'hbs');

app.use('/static', express.static('static'))
app.use(middleware(webpack(config), {
  publicPath: config.output.publicPath
}))

app.get('/', (req, res) => {
  res.render('index')
})

app.get('/opengraph', (req, res) => {
  fetcher.fetch(req.query.url, opengraph => {
    res.send(opengraph)
  })
})

app.listen(3000, () => console.log('tinymce-plugin-opengraph dev app listening on port 3000.'))
