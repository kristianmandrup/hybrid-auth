extend = (obj, mixin) ->
  for name, method of mixin
    obj[name] = method
  obj

include = (klass, mixin) ->
  extend klass.prototype, mixin

module.exports =
  extend: extend
  include: include