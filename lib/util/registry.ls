module.exports =
  find: (name) ->
    @registry[name] or throw Error "#{name} is not registered."

  register: (name, clazz) ->
    unless typeof name is 'string'
      throw Error "First argument must be the name to register the class under"

    @registry[name] = clazz

  registry: {}
