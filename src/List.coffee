_bind = (f) -> this.val.map(f).reduce (a,b)-> unit a.val.concat b.val

unit = (input) ->
  Object.freeze
    val: input
    bind: _bind

List = (input...)-> unit input

module.exports = {List}