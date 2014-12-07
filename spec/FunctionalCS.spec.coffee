# jasmine-node --coffee --verbose spec/
{p} = require '../util/log'
require '../src/FunctionalCS'

f1 = (input)-> [0..input].map (i)->i+1

describe 'List Monad', ->
  it 'flatmaps', ->
    res =
      [1, 2, 3]
      .bind(f1)
    expect(res).toEqual [ 1, 2, 1, 2, 3, 1, 2, 3, 4 ]

  it 'has head', ->
    expect([1,2,3].head()).toEqual 1

  it 'has last', ->
    expect([1,2,3].last()).toEqual 3

  it 'has init', ->
    expect([1,2,3].init()).toEqual [1, 2]

  it 'has tail', ->
    expect([1,2,3].tail()).toEqual [2, 3]

  it 'splits and flattens array', ->
    res = [1,2,3,4,5].splitAt(3)
    expect(res).toEqual [[1,2,3], [4,5]]
    res = res.flatten()
    expect(res).toEqual [1,2,3,4,5]

  it 'groups by identity', ->
    res = [1,2,3,3,4,5,1].groupBy (x)-> x
    expect(res[1]).toEqual [1,1]


