_bind = (f) ->
  val = this
  IO (-> f(val())())

unit = (input) ->
  input.bind = _bind
  Object.freeze input

IO = (input)-> unit input

module.exports = {IO}