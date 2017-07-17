path = require 'path'
callsite = require 'callsite'

module.exports = (shipit) ->
  configPath = path.dirname(callsite()[1].getFileName())

  shipit.blTask 'local', ->
    shipit.config.repositoryUrl = shipit.config.localRepositoryUrl or configPath
