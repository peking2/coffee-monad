{p} = require '../util/log'
{IO, getLine, putStrLn} = require '../src/IO'

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
    s = "Monad test"
    getLine = jasmine.createSpy("getLine spy").andReturn s
    spyOn(console, 'log')
    do monad
    expect(getLine).toHaveBeenCalled()
    expect(console.log).toHaveBeenCalledWith s
    expect(console.log).toHaveBeenCalledWith 'end.'


