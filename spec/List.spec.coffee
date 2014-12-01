# jasmine-node --coffee --verbose spec/
{p} = require '../util/log'
require '../src/List'

f1 = (input)-> [0..input].map (i)->i+1

describe 'List Monad', ->
  it 'flatmaps', ->
    res =
      [1, 2, 3]
        .bind(f1)
    expect(res).toEqual [ 1, 2, 1, 2, 3, 1, 2, 3, 4 ]


