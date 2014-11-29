rs = require 'readline-sync'

_bind = (f) ->
  val = this
  IO (-> f(val())())

unit = (input) ->
  input.bind = _bind
  Object.freeze input

IO = (input)-> unit input

getLine = IO rs.question
putStrLn = (x)-> IO (-> console.log x)

module.exports = {IO, getLine, putStrLn}