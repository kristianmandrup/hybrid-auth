loginResolver = (deferred) ->
  (resolve, reject) ->
    if resolve
      deferred.resolve
    else
      deferred.reject

module.exports =
  signIn: (settings, promise) ->
    deferred = promise.defer!

    if typeof plugins is undefined
      msg = 'Plugins are only available on the simulator or on a real device.';
      return deferred.reject(msg);

    if typeof plugins.googleplus is undefined
      msg = 'The google plus plugin was not found: https://github.com/poetic/cordova-plugin-googleplus'
      return deferred.reject msg

    plugins.googleplus.login settings, loginResolver(deferred)
