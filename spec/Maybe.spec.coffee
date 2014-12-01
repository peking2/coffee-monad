# jasmine-node --coffee --verbose spec/
{p} = require '../util/log'
{Nothing, Just} = require '../src/Maybe'

fNothing = (input)-> Nothing

f1 = (input)-> Just input+1

describe 'Maybe Monad', ->
  it 'creates Nothing', ->
    expect(Just null).toEqual Nothing
    expect(Just undefined).toEqual Nothing
    expect(Just()).toEqual Nothing
    expect(Just(null) is Nothing).toBeTruthy()

  it 'creates Just', ->
    expect(Just(3).val).toEqual 3
    expect(Just('abc').val).toEqual 'abc'
    expect(Just([1,2,3]).val).toEqual [1,2,3]
    expect(Just({name: 'abc'}).val).toEqual {name: 'abc'}

  it 'returns 3', ->
    res =
      Just(0)
        .bind(f1)
        .bind(f1)
        .bind(f1)
    expect(res).toEqual Just 3
    {val} = res
    expect(val).toEqual 3

  it 'returns Nothing', ->
    res =
      Just(0)
      .bind(f1)
      .bind(fNothing)
      .bind(f1)
    expect(res).toEqual Nothing



