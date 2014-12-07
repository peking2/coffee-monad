{p} = require '../util/log'

Array.prototype.bind = (f) -> this.map(f).reduce (a,b)-> a.concat b
Array.prototype.head = -> this[0]
Array.prototype.last = -> this[-1..][0]
Array.prototype.init = -> this[0...-1]
Array.prototype.tail = -> this[1..-1]
Array.prototype.splitAt = (n)-> [this[0...n], this[n..]]
Array.prototype.flatten = -> this.reduce (prev, curr)-> prev.concat curr
Array.prototype.groupBy = (f)->
  res = {}
  for i in this
    key = f i
    res[key] ?= []
    res[key].push i
  res


