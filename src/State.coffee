{p} = require '../util/log'

_bind = (f)->
  h = this
  unit (s)->
    [a, newState] = h s
    g = f a
    g newState

# input: s-> [a, s]
unit = (input)->
  input.bind = _bind
  Object.freeze input

State = unit

module.exports = {State}


