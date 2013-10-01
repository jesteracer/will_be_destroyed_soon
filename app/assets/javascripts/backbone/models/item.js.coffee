class Lam.Models.Item extends Backbone.Model
  url: ->
    u = "/items"
    u = "/items/#{this.id}" if this.id
    u
  defaults:
    name: null
    description: null
    price: null
    active: null

class Lam.Collections.ItemsCollection extends Backbone.Collection
  model: Lam.Models.Item
  url: '/items'
