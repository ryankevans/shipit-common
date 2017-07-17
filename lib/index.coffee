module.exports = (shipit) ->
  require('./shipit-default')(shipit)
  require('./shipit-local')(shipit)
  require('./shipit-utils')(shipit)
