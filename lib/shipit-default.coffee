os = require 'os'
path = require 'path'
callsite = require 'callsite'
_ = require 'lodash'

module.exports = (shipit) ->
  ic = shipit.initConfig

  shipit.initConfig = (config) ->
    shipitfileFn = callsite()[1].getFileName()
    shipitfileDir = path.basename(path.dirname(shipitfileFn))

    DEFAULT = {
      default:
        workspace: path.join(os.tmpdir(), 'shipit', shipitfileDir)
        keepReleases: Number.MAX_SAFE_INTEGER
    }

    newConfig = _.defaultsDeep({}, config, DEFAULT)

    ic.call shipit, newConfig
