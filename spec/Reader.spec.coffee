# jasmine-node --coffee --verbose spec/
{p} = require '../util/log'
{Reader} = require '../src/Reader'

describe 'Reader Monad', ->
  it 'returns 19', ->
    res = Reader((x)-> x*2).bind (a)->
      Reader((x)-> x+10).bind (b)->
        Reader -> a+b
    expect(res(3)).toEqual 19





