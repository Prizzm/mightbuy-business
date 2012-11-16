class @Mightbuy.RetailLeads
  constructor: ->
    $("#photo-email-button").click (event) ->
      $(".saving-loader").show()
      $("#send_email").val('1')
      $("#photo-form").submit()
      event.preventDefault()

    $("#photo-submit-button").click (event) ->
      $(".saving-loader").show()
      $("#send_email").val('0')
      $("#photo-form").submit()
      event.preventDefault()

jQuery ->
  new Mightbuy.RetailLeads()

