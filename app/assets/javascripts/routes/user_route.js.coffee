KnifeWebTest.UserRoute = Em.Route.extend
  model: ->
    if KnifeWebTest.Auth.get('signedIn')
      KnifeWebTest.Auth.get('user')