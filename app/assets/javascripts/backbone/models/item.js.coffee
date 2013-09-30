class Lam.Models.Item extends Backbone.Model
  paramRoot: 'item'

  defaults:
    name: null
    description: null
    price: null
    active: null

class Lam.Collections.ItemsCollection extends Backbone.Collection
  model: Lam.Models.Item
  url: '/items'
