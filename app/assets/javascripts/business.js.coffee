# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

class @Mightbuy.Business
  constructor: ->
    if $(".more-url").length > 0
      $(".more-url").click @addMoreURL

    $(".add-product-btn").live('click',@showAddProduct)

  addMoreURL: ->
    next_counter = $(".business-urls input[type='text']").length
    $(".business-urls").append($(JST["templates/add_url"]({counter: next_counter})))
    $(".less-url").click ->
      $(this).parent("div").remove()

  showAddProduct: =>
    $(".add-product-row").toggle()

jQuery ->
  new Mightbuy.Business()
