path = require 'path'
_ = require 'lodash'

class Utils
  @findShipitfile: (stack) ->
    _.find(stack, (el) ->
      path.basename(el.getFileName()).split('.')[0].match /shipitfile/i
    ).getFileName()

module.exports = Utils
