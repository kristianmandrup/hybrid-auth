class TokenHandler
  (@authProviderName, @isNative = false) ->

    # default authhandler
  authHandler: (authObj) ->
    console.log 'received authObj', authObj

  setAuthHandler: (@authHandler) ->

  tokenReceived: (token) ->
    # console.log 'received token', token
    throw Error "TokenHandler subclass must implement tokenReceived"

  tokenError: (error) ->
    console.log 'Could not get access token', error

util = require '../util'
util.xtender.extend TokenHandler, util.Registry

module.exports = TokenHandler
