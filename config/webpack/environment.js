const { environment } = require('@rails/webpacker')
const { VueLoaderPlugin } = require('vue-loader')
const vue = require('./loaders/vue')
const MiniCssExtractPlugin = require('mini-css-extract-plugin')
environment.loaders.delete('css')
environment.loaders.delete('sass')
environment.loaders.delete('moduleSass')
environment.loaders.delete('moduleCss')

environment.loaders.prepend('scss', {
  test: /\.(css|sass|scss)$/,
  use: [
    MiniCssExtractPlugin.loader,
    'css-loader'
    // 'sass-loader'
    // 'import-glob-loader'
  ]
})

environment.plugins.prepend('VueLoaderPlugin', new VueLoaderPlugin())
environment.loaders.prepend('vue', vue)
// module.exports = environment

const customConfig = {
  resolve: {
    fallback: {
      dgram: false,
      fs: false,
      net: false,
      tls: false,
      child_process: false
    }
  }
};

environment.config.delete('node.dgram')
environment.config.delete('node.fs')
environment.config.delete('node.net')
environment.config.delete('node.tls')
environment.config.delete('node.child_process')

environment.config.merge(customConfig);

module.exports = environment