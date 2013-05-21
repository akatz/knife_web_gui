KnifeWebTest.ServersRoute = Ember.Route.extend(
  model: ->
    KnifeWebTest.Server.find()
)