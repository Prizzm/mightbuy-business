class @Mightbuy.LogoUploader
  constructor: ->
    @logo_form = $("#business_logo_form")
    if @logo_form.length > 0
      @bindUrlButton()
      @bindUploadButton()

  bindUrlButton: ->
    $(document).bind 'reveal.facebox', =>
      $("#facebox .save-url").click =>
        $("#business_logo_url").val $("#facebox input").val()
        @logo_form.submit()

    $("#logo-url-button").click =>
      $.facebox div: "#business_logo_url_wrapper"
      false

  bindUploadButton: ->
    $("#business_logo").fileupload
      replaceFileInput: false,
      dataType: 'json',
      add: (e, data) =>
        @logo_form.submit()
        true

    $("#logo-upload-button").click =>
      $("#business_logo").click()
      false

jQuery ->
  Mightbuy.logoUploader = new Mightbuy.LogoUploader()
  $("#ajax-loading").
    ajaxStart( ->
      $(this).fadeIn('slow')
    ).ajaxStop( ->
      $(this).fadeOut('slow')
    )
