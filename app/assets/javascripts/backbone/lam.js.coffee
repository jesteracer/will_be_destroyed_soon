#= require_self
#= require_tree ./templates
#= require_tree ./models
#= require_tree ./views
#= require_tree ./routers

window.Lam =
  Models: {}
  Collections: {}
  Routers: {}
  Views: {}
  init: ->
    new Lam.Routers.ItemsRouter()
    Backbone.history.start()

$(document).ready ->
  Lam.init()
