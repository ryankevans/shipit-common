module.exports = (shipit) ->

  shipit.localQuiet = (command, options, cb) ->
    _stdout = shipit.options.stdout
    shipit.options.stdout = null
    shipit.local(command, options, cb).then (r) ->
      shipit.options.stdout = _stdout
      r

