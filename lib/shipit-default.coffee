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
        workspace: path.join(os.tmpdir(), 'shipit', shipitfileDir)

        # no longer using the following setting to keep all releases ...
        # server HDDs were filling up after a short while. node.js
        # deployments tend to be a couple hundred MB due to node_modules, the
        # default for keepReleases is 5 and that's probably reasonable after all
        # keepReleases: Number.MAX_SAFE_INTEGER
    }

    newConfig = _.defaultsDeep({}, config, DEFAULT)

    ic.call shipit, newConfig
