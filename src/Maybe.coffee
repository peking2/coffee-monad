unit = (input) ->
  Object.freeze
    val: if input? then input else null
    bind: (f)-> switch this
      when Nothing then Nothing
      else f this.val

Nothing = unit null

Just = (input)-> if input? then unit input else Nothing

module.exports = {Nothing, Just}