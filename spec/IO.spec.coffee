rs = require 'readline-sync'
{p} = require '../util/log'
{IO} = require '../src/IO'

getLine = IO rs.question
putStrLn = (x)-> IO (-> console.log "putStrLn:#{x}")

monad = null

describe 'IO Monad', ->
  it 'creates IO()', ->
    res = putStrLn
    expect(typeof res).toEqual 'function'
    expect(typeof res.bind).toEqual 'function'

  it 'gets input and output', ->
    res =
      putStrLn('start...')
        .bind(-> getLine)
        .bind(putStrLn)
        .bind(-> putStrLn('end.'))
    expect(typeof res).toEqual 'function'
    expect(typeof res.bind).toEqual 'function'
    monad = res

  it 'runs Monad', ->
    do monad

