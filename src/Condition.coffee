{p, Log} = require '../util/log'
###
  This monad is to solve a real world problem I encoutered recently.
  Given a list of functions (f :: (callback)-> callback err, res), make a program to call them sequentially and
  1. if err returned, add err into errors array and continue
  2. if res returned, add them into res array and continue
  3. if res.length reachs a limit, stop
  I don't see an existing monad can achieve it, so I wrote a customized monad which is called Condition
###

_bind = (f) ->
  if this.check()
    this
  else
    f.func (cond)=> _unit this.check, this.errors.concat(cond.errors), this.res.concat(cond.res)

###
  check :: -> Bool
  errors :: []
  res :: []
  func :: (callback)-> callback err, res
###
_unit = (check, errors, res, func)->
  m = {}
  m.check = check ? -> true
  m.errors = errors ? []
  m.res = res ? []
  m.bind = _bind
  m.func =
    if func?
      (callback)->
        func (err, res)->
          errors = if err? then [err] else []
          _unit(check, errors, res).func callback
    else
      (callback)-> callback this
  Object.freeze m

Condition = _unit

module.exports = Condition

