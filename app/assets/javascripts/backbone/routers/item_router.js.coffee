class Lam.Routers.ItemsRouter extends Backbone.Router
  initialize: (options) ->

  routes:
    '': 'index'
  
  index: ->
    index_view = new Lam.Views.ItemsIndex(collection: items)
    $('#items_index').html(index_view.render().el)

    form_view = new Lam.Views.ItemsForm
    $('#items_form').html(form_view.render().el)
