KnifeWebTest.Router.map ->
  @resource "servers", ->
    @route "new"
    @route "save"
    @resource "server", path: ":server_id"
  @resource 'user', path: '/user'
  @resource 'knife_config'