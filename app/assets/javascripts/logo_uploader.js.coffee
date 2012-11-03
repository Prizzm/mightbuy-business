class @Mightbuy.LogoUploader
  constructor: ->
    @logo_form = $("#business_logo_form")
    if @logo_form.length > 0
      @bindUploadButton()

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
