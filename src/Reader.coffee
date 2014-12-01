{p} = require '../util/log'

_bind = (f)-> (w)=> f(this w) w

_unit = (input)->
  input.bind = _bind
  Object.freeze input

Reader = _unit

module.exports = {Reader}


