rs = require 'readline-sync'
{p} = require '../util/log'

_bind = (f) -> IO (=> f(this())())

_unit = (input) ->
  input.bind = _bind
  Object.freeze input

IO = _unit

getLine = IO rs.question
putStrLn = (x)-> IO (-> console.log x)

module.exports = {IO, getLine, putStrLn}