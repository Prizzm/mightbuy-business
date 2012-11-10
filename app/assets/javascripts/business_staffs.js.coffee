# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

class @Mightbuy.BusinessStaff
  constructor: ->
    $(".cancel-new-staff").live('click', -> $(".add-staff-row").hide())
    $(".add-staff-button").live('click', -> $(".add-staff-row").show())

jQuery ->
  new Mightbuy.BusinessStaff()
