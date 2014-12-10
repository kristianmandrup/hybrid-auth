AuthHandler = require './auth-handler'

class FirebaseAuthHandler extends AuthHandler
  (ref, authHandler) ->
    @setFirebaseRef(ref)
    @init authHandler

  setFirebaseRef: (ref) ->
    @firebaseRef = buildRef(ref)
    @

  init: (authHandler) ->
    @setAuthHandler authHandler if authHandler
    @firebaseRef.onAuth @authHandler
    @

AuthHandler.register 'firebase', FirebaseTokenHandler

util = require '../util'
util.extender.include FirebaseAuthHandler, util.Firebaser

module.exports = FirebaseAuthHandler