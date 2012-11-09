# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$.fn.setAllToMaxHeight = ->
  @height Math.max.apply(this, $.map(this, (e) ->
    $(e).height()
  ))

$(document).ready ->
  $("div.unevenheights").setAllToMaxHeight()
  $('div.unevenheights-caption').setAllToMaxHeight()
  $('div.uneven-val').setAllToMaxHeight()
  $('.account-profile .btn.btn-red.w230').removeClass("disabled")

$(window).resize ->
  $("div.unevenheights").setAllToMaxHeight()
  $('div.unevenheights-caption').setAllToMaxHeight()
  $('div.uneven-val').setAllToMaxHeight()


class @Mightbuy.ProductsList
  constructor: ->
    @bindAddDeals()

  bindAddDeals: ->
    $(".add-deal-button").click (e) ->
      el = $(e.currentTarget)

      productId = el.attr("data-product-id")
      dealId    = "#add-deal-form-wrapper-#{productId}"
      dealForm  = $(dealId)
      if dealForm.length < 1
        productRow  = $("#product-#{productId}")
        productName = productRow.find(".product-name").text()
        template = JST["templates/add_deal"]
          productId:   productId
          productName: productName
        productRow.after $(template)

        $(dealId).find(".cancel-deal").click (evt)->
          $(dealId).remove()
          evt.preventDefault()

      e.preventDefault()


jQuery ->
  Mightbuy.productsList = new Mightbuy.ProductsList()
