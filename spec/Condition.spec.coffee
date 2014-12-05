{p} = require '../util/log'
Condition = require '../src/Condition'

describe 'Condition Monad', ->
  it 'should be basic monad', (done)->
    m = Condition()
    expect(m.errors).toEqual []
    expect(m.res).toEqual []
    expect(m.check()).toBeTruthy()
    m.func (cond)->
      expect(cond).toEqual m
      done()

  it 'should return [1,2,3]', (done)->
    check = ->
      limit = 5
      this.res.length is limit

    m = Condition check
    f1 = Condition check, null, null, (callback)-> callback null, [1, 2, 3]
    m.bind(f1).func (cond)->
      expect(cond.res).toEqual [1, 2, 3]
      done()

  it 'should return [1,2,3]', (done)->
    check = ->
      limit = 3
      this.res.length is limit

    m = Condition check
    f1 = Condition check, null, null, (callback)-> callback null, [1, 2, 3]
    f2 = Condition check, null, null, (callback)-> callback null, [4, 5, 6]
    m.bind(f1).bind(f2).func (cond)->
      expect(cond.res).toEqual [1, 2, 3]
      done()
