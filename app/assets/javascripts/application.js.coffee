# This is a manifest file that'll be compiled into including all the files listed below.
# Add new JavaScript/Coffee code in separate files in this directory and they'll automatically
# be included in the compiled file accessible from http://example.com/assets/application.js
# It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
# the compiled file.
#
#= require jquery
#= require jquery_ujs
#= require handlebars
#= require ember
#= require ember-data
#= require ember-auth
#= require_self
#= require auth
#= require twitter/bootstrap/dropdown
#= require knife_web_test
window.KnifeWebTest = Ember.Application.create(
 ready: ->
    # setInterval(->
    #   KnifeWebTest.ServersController.set('model', KnifeWebTest.Server.find())
    # , 60000)
)

#= require_tree .
