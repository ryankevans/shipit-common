os = require 'os'
path = require 'path'
callsite = require 'callsite'
utils = require './utils'
_ = require 'lodash'

module.exports = (shipit) ->
  ic = shipit.initConfig

  shipit.initConfig = (config) ->
    shipitfileFn = utils.findShipitfile(callsite())
    shipitfileDir = path.basename(path.dirname(shipitfileFn))

    DEFAULT = {
      default:
        branch: 'master'
        workspace: path.join(os.tmpdir(), 'shipit', shipitfileDir)
        ignores: [ '.DS_Store', '.git', 'node_modules', 'bower_components' ]
        deleteOnRollback: false
        keepReleases: 5    }

    newConfig = _.defaultsDeep({}, config, DEFAULT)

    ic.call shipit, newConfig
