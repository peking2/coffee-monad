# jasmine-node --coffee --verbose spec/
{p} = require '../util/log'
{State} = require '../src/State'

pop = State (s)-> [s[-1..], s[0...-1]]
push = (a)-> State (s)-> [null, s.concat [a]]

describe 'State Monad', ->
  state = [1, 2, 3]
  it 'should pop 3', ->
    res = pop state
    expect(res).toEqual [[3], [1,2]]

  it 'should push 4', ->
    res = push 4
    expect(res(state)).toEqual [null, [1, 2, 3, 4]]

  it 'simulates stack', ->
    res =
      push(3).bind ->
        pop.bind ->
          pop
    expect(res(state)).toEqual [[3], [1, 2]]





