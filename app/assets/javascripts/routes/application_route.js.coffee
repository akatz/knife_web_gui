KnifeWebTest.ApplicationRoute = Ember.Route.extend(events:
  syncServers: ->
    $.get "/sync"
    @controllerFor("servers").set('model',KnifeWebTest.Server.find() )
)