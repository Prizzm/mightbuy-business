# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$.fn.setAllToMaxHeight = ->
  @height Math.max.apply(this, $.map(this, (e) ->
    $(e).height()
  ))

$(document).ready ->
  $("div.unevenheights").setAllToMaxHeight()
  $('.account-profile .btn.btn-red.w230').removeClass("disabled")

$(window).resize ->
  $("div.unevenheights").setAllToMaxHeight()