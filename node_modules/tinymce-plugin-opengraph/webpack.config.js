const path = require('path')
const webpack = require('webpack')
const CopyWebpackPlugin = require('copy-webpack-plugin')

const pluginName = 'opengraph'

const config = {
  entry: {
    'bundle': './src/index.js'
  },
  output: {
    publicPath: '/',
    path: path.join(__dirname, './dist', pluginName),
    filename: '[name].js'
  },
  module: {
    rules: [
      {
        test: /\.js$/,
        exclude: /node_modules/,
        use: 'babel-loader'
      },
      {
        test: /\.css$/,
        use: [
          'style-loader',
          'css-loader'
        ]
      },
      {
        test: /\.scss$/,
        use: [
          'style-loader',
          'css-loader',
          'sass-loader'
        ]
      }
    ]
  },
  plugins: []
}


module.exports = (env, argv) => {

  if (argv.mode === 'production') {
    config.entry = {
      'plugin': './src/index.js',
      'plugin.min': './src/index.js'
    }

    config.plugins.push(
      new CopyWebpackPlugin([{
        from: path.join(__dirname, './src/LICENSE'),
        to: path.join(__dirname, './dist', pluginName)
      }])
    )

    config.mode = 'production'
  } else {
    config.mode = 'development'
  }

  return config
}
