class Lam.Models.Item extends Backbone.Model
  url: ->
    url = "/items"
    url = "/items/#{this.id}" if this.id
    url

  defaults:
    name: null
    description: null
    price: null
    active: null

class Lam.Collections.ItemsCollection extends Backbone.Collection
  model: Lam.Models.Item
  url: '/items'
