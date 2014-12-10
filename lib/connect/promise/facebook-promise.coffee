if plugins is undefined
  plugins = {}

unless facebookConnectPlugin is undefined
  plugins.facebook = facebookConnectPlugin

loginResolver = (deferred) ->
  (res) ->
    if res.authResponse.accessToken
      deferred.resolve res
    else
      deferred.reject 'Error authenticating with Facebook. Please sign up or in with an email and password.'

resolvePromise = (promise, ...) ->
  if typeof promise is 'function' then new promise(arguments) else promise(arguments)

module.exports =
  signIn: (permissions, promise) ->
    deferred = promise.defer()
    if plugins.facebook
      plugins.facebook.login permissions, loginResolver(deferred)
      deferred.promise
    else
      deferred.reject 'Facebook login only available in app'
