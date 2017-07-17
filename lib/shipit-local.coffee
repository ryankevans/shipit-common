path = require 'path'
callsite = require 'callsite'
utils = require './utils'

module.exports = (shipit) ->
  configPath = path.dirname(utils.findShipitfile(callsite()))

  shipit.blTask 'local', ->
    shipit.config.repositoryUrl = shipit.config.localRepositoryUrl or configPath
