$(document).ready ->
  $("#fileselectbutton").click (e) ->
    $(".photo-upload input[type='file']").trigger "click"

  $(".photo-upload input[type='file']").change (e) ->
    val = $(this).val()
    file = val.split(/[\\/]/)
    $("#filename").val file[file.length - 1]

class @Mightbuy.LeadPhotoPreview
  constructor: ->
    @photo_preview = $("#lead-photo-preview")
    @bindPhotoPreviewer() if @photo_preview.length > 0

  # well this bind the photo file uploader
  bindPhotoPreviewer: ->
    $("#customer_lead_photo").fileupload
      replaceFileInput: false,
      process: [
        {
          action: 'load',
          fileTypes: /^image\/(gif|jpeg|png)$/,
          maxFileSize: 20000000
        },
        {
          action: 'resize',
          maxWidth: 800,
          maxHeight: 350,
          minWidth: 100,
          minHeight: 100
        },
        {
          action: 'save'
        }
      ]
      add: (e, data) =>
        window.loadImage data.files[0], (imgOrError) =>
          if imgOrError.type != "error"
            @image = $(imgOrError)

            previewWidth  = @photo_preview.width()
            previewHeight = @photo_preview.height()
            imageWidth    = @image.attr("width")
            imageHeight   = @image.attr("height")

            if  imageWidth > previewWidth
              @image.css({'width' : '800px', 'height' : 'auto'})

            if imageHeight > previewHeight
              @image.css({'width' : 'auto', 'height' : '350px'})

            @photo_preview.html @image
        $("#customer_lead_photo").fileupload('process', data).done ->
          $("#photo-form").one "submit", (e) =>
            data.submit()
            e.preventDefault()
            e.stopPropagation() # to avoid rails UJS taking over over and submitting form again
        true

jQuery ->
  Mightbuy.leadPhotoPreview = new Mightbuy.LeadPhotoPreview()
