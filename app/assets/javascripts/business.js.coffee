# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

class @Mightbuy.Business
  constructor: ->
    if $(".more-url").length > 0
      $(".more-url").click @addMoreURL

  addMoreURL: ->
    $(".business-urls").append($(JST["templates/add_url"]({})))
    $(".less-url").click ->
      $(this).parent("div").remove()

jQuery ->
  new Mightbuy.Business()
