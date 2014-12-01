_bind = (f) -> switch this
  when Nothing then Nothing
  else f this.val

_unit = (input) ->
  Object.freeze
    val: input ? null
    bind: _bind

Nothing = _unit null

Just = (input)-> if input? then _unit input else Nothing

module.exports = {Nothing, Just}