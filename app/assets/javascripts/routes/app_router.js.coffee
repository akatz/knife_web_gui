KnifeWebTest.Router.map ->
  @resource "servers", ->
    @route "new"
    @route "save"
    @resource "server", path: ":server_id"
  @resource 'users', ->
    @route 'show', {path: '/:user_id'}