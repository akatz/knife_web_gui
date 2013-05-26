KnifeWebTest.ApplicationRoute = Ember.Route.extend(
  setupController: (controller) ->
    controller.set('content', KnifeWebTest.Auth.get('user'))

  syncServers: ->
    $.get "/sync"
    @controllerFor("servers").set('model',KnifeWebTest.Server.find() )
)