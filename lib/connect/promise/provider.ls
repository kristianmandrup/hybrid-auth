providers = require './index'
Q         = require 'q'

class Provider
  constructor: (name, @promise) ->
    @signer = providers[name]

  signin: (options, promise)->
    @signer.signIn options, (promise or @promise or Q)
