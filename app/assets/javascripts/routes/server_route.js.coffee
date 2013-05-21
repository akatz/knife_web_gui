KnifeWebTest.ServerRoute = Ember.Route.extend(
  setupController: (model) ->
    @controllerFor("servers").set "selectedServer", model
)