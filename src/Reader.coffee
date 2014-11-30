{p} = require '../util/log'

_bind = (f)->
  val = this
  (w)-> f(val w) w

unit = (input)->
  input.bind = _bind
  Object.freeze input

Reader = unit

module.exports = {Reader}


