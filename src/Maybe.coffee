_bind = (f) -> switch this
  when Nothing then Nothing
  else f this.val

unit = (input) ->
  Object.freeze
    val: input ? null
    bind: _bind

Nothing = unit null

Just = (input)-> if input? then unit input else Nothing

module.exports = {Nothing, Just}