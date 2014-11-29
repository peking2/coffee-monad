{p} = require '../util/log'

_bind = (f) ->
  {res, logs} = this
  {res: res_new, logs: logs_new} = f res
  unit res_new, logs.concat logs_new

unit = (res, logs) ->
  Object.freeze
    res: res
    logs: logs ? []
    bind: _bind


Writer = unit

module.exports = {Writer}