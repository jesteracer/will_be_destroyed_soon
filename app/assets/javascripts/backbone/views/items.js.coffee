class Lam.Views.ItemsIndex extends Backbone.View
  template: JST['backbone/templates/index']

  initialize: ->
    @collection.on('add', @render, this)
    @collection.on('reset', @render, this)
    @collection.on('change', @render, this)

   events:
     'click .edit_item': 'edit_item'

  ttt: ->
    console.log "sync!"
  render: ->
    $(@el).html(@template(items: @collection))
    this
  
  edit_item: (e) ->
    e.preventDefault()
    id = $(e.currentTarget).data("id")
    form_view = new Lam.Views.ItemsForm(item: items.get(id))
    $('#items_form').html(form_view.render().el)


class Lam.Views.ItemsForm extends Backbone.View
  template: JST['backbone/templates/form']

  events:
    'click #create_item': 'create_item'
    'click #update_item': 'update_item'
    'click #change_form_to_create': 'change_form_to_create'

  render: ->
    @item = this.options.item || new Lam.Models.Item
    $(@el).html(@template(item: @item))
    this

  build_item_from_form: (item) ->
    form = $("form", @el)
    @item.set "name", $("#item_name", form).val()
    @item.set "description", $("#item_description", form).val()
    @item.set "price", $("#item_price", form).val()

  create_item: ->
    that = this
    @build_item_from_form()
    @clear_validation_errors()
    @item.save null,
      success: (model, response) ->
        that.clear_form()
        items.add(model)
        that.change_form_to_create()
      error: (model, response) ->
        that.validation_failed(response.responseJSON)

  update_item: ->
    that = this
    @build_item_from_form()
    @clear_validation_errors()
    @item.save null,
      success: (model, response) ->
        model.set "status", "valid"
      error: (model, response) ->
        model.set "status", "invalid"
        that.validation_failed(response.responseJSON)
 
  clear_validation_errors: ->
    form = $("form", @el)
    $(".error", form).fadeOut()
    $(".field_holder", form).removeClass("errors")

  clear_form: ->
    form = $("form", @el)
    form[0].reset()

  validation_failed: (errors) ->
    form = $("form", @el)
    Object.keys(errors).forEach (key) ->
      holder = $("#item_#{key}_holder", form)
      holder.addClass("errors")
      $(".error", holder).html(errors[key]).fadeIn()

  change_form_to_create: ->
    form_view = new Lam.Views.ItemsForm
    $('#items_form').html(form_view.render().el)




    
