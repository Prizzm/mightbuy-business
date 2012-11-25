class @Mightbuy.RetailLeads
  constructor: ->
    $("#photo-email-button").click (event) ->
      $(".saving-loader").show().delay(30000).fadeOut()
      $("#send_email").val('1')
      $("#photo-form").submit()
      event.preventDefault()


    $("#photo-submit-button").click (event) ->
      $(".saving-loader").show().delay(30000).fadeOut()
      $("#send_email").val('0')
      $("#photo-form").submit()
      event.preventDefault()


    $("#customer_lead_email").keyup (event) ->
      $el = $(this)
      if $el.val().length
        $("#photo-submit-button").attr("disabled", false)
        $("#photo-email-button").attr("disabled", false)
      else
        $("#photo-submit-button").attr("disabled", true)
        $("#photo-email-button").attr("disabled", true)


    $(".lead-capture .close").click (event) ->
      $(".saving-loader").hide()


    $(".lead-capture").click (event) ->
      $(".saving-loader").hide()
      event.stopPropagation();


jQuery ->
  new Mightbuy.RetailLeads()