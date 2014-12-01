# jasmine-node --coffee --verbose spec/
{p} = require '../util/log'
{Writer} = require '../src/Writer'

f1 = (res)-> Writer res+1, ["res is #{res}"]

describe 'Writer Monad', ->
  it 'creates logs: []', ->
    w = Writer 1
    expect(w.res).toEqual 1
    expect(w.logs).toEqual []

  it 'creates logs: [1,2,3]', ->
    arr = [1, 2, 3]
    w = Writer 1, arr
    expect(w.res).toEqual 1
    expect(w.logs).toEqual arr

  it 'increases res from 0 to 3', ->
    w =
      Writer(0)
        .bind(f1)
        .bind(f1)
        .bind(f1)
    expect(w.res).toEqual 3
    expect(w.logs).toEqual [ 'res is 0', 'res is 1', 'res is 2' ]



