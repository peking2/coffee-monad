rs = require 'readline-sync'
{p} = require '../util/log'

_bind = (f) ->
  val = this
  IO (-> f(val())())

unit = (input) ->
  input.bind = _bind
  Object.freeze input

IO = unit

getLine = IO rs.question
putStrLn = (x)-> IO (-> console.log x)

module.exports = {IO, getLine, putStrLn}