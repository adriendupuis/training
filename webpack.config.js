const Encore = require('@symfony/webpack-encore');
const path = require('path');
const getEzConfig = require('./ez.webpack.config.js');
const eZConfigManager = require('./ez.webpack.config.manager.js');
const eZConfig = getEzConfig(Encore);
const customConfigs = require('./ez.webpack.custom.configs.js');

Encore.reset();
Encore.setOutputPath('public/assets/build')
    .setPublicPath('/assets/build')
    .enableSassLoader()
    .enableReactPreset()
    .enableSingleRuntimeChunk();

Encore
    .addStyleEntry('training', [
        path.resolve(__dirname, './assets/css/normalize.css'),
        path.resolve(__dirname, './assets/css/bootstrap.min.css'),
        path.resolve(__dirname, './assets/css/bootstrap-theme.css'),
        path.resolve(__dirname, './assets/scss/style.scss') // Our custom styling
    ])
    .addEntry('training-js', [
        path.resolve(__dirname, './assets/js/bootstrap.min.js')
    ])
    .autoProvidejQuery();

const projectConfig = Encore.getWebpackConfig();
module.exports = [ eZConfig, ...customConfigs, projectConfig ];
