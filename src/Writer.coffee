{p} = require '../util/log'

_bind = (f) ->
  {res, logs} = this
  {res: res_new, logs: logs_new} = f res
  _unit res_new, logs.concat logs_new

_unit = (res, logs) ->
  Object.freeze
    res: res
    logs: logs ? []
    bind: _bind


Writer = _unit

module.exports = {Writer}