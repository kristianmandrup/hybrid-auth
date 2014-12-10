if plugins is undefined
  plugins = {}

unless facebookConnectPlugin is undefined
  plugins.facebook = facebookConnectPlugin

loginResolver = (resolve, reject) ->
  (res) ->
    if res.authResponse.accessToken
      resolve res
    else
      reject 'Error authenticating with Facebook. Please sign up or in with an email and password.'

module.exports =
  signIn: (permissions, Promise) ->
    if typeof facebookConnectPlugin is 'undefined'
      new Promise(resolve, reject) ->
        plugins.facebook.login permissions, loginResolver, reject
    else
      Promise.reject('Facebook login only available in app')
