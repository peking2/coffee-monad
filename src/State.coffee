{p} = require '../util/log'

_bind = (f)->
  _unit (s)=>
    [a, newState] = this s
    g = f a
    g newState

# input: s-> [a, s]
_unit = (input)->
  input.bind = _bind
  Object.freeze input

State = _unit

module.exports = {State}


