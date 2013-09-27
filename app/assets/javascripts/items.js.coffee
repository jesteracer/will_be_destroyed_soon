# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


$ ->
  clear_errors = (form) ->
    $(".error", form).fadeOut()
    $(".field_holder", form).removeClass("errors")


  $('form.item').on 'ajax:success', (event, data, status, xhr) ->
    form = this
    clear_errors(form)
    document.location.href='/items'

  $('form.item').on 'ajax:error', (event, data, status, xhr) ->
    form = this
    clear_errors(form)
    errors = data.responseJSON
    Object.keys(errors).forEach (key) ->
      holder = $("#item_#{key}_holder", form)
      holder.addClass("errors")
      $(".error", holder).html(errors[key]).fadeIn()
