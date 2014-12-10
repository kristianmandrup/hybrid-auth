buildRef = (ref) ->
  typeof ref is 'string' ? new Firebase "https://#{ref}.firebaseio.com" : ref

Firebaser =
  setFirebaseRef: (ref) ->
    @firebaseRef = buildRef(ref)

module.exports = Firebaser