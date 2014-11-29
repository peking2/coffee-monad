# jasmine-node --coffee --verbose spec/
{p} = require '../util/log'
{List} = require '../src/List'

f1 = (input)->
  List.apply null, ([0..input].map (i)->i+1)

describe 'Maybe Monad', ->
  it 'creates list', ->
    expect(List(1,2,3).val).toEqual [1,2,3]
    expect(List(1,2,3)).toEqual List.apply null, [1,2,3]

  it 'creates embeded list', ->
    expect(List([1,2,3]).val).toEqual [[1,2,3]]
    expect(List([1,2,3])).toEqual List.apply null, [[1,2,3]]

  it 'flatmaps', ->
    res =
      List(1,2,3)
        .bind(f1)
    expect(res.val).toEqual [ 1, 2, 1, 2, 3, 1, 2, 3, 4 ]
    {val} = res
    expect(val).toEqual [ 1, 2, 1, 2, 3, 1, 2, 3, 4 ]


