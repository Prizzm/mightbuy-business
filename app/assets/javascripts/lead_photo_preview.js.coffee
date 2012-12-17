$(document).ready ->
  $("#fileselectbutton").click (e) ->
    $(".photo-upload input[type='file']").trigger "click"

  $(".photo-upload input[type='file']").change (e) ->
    val = $(this).val()
    file = val.split(/[\\/]/)
    $("#filename").val(file[file.length - 1])

class @Mightbuy.LeadPhotoPreview
  constructor: ->
    @photo_preview = $("#lead-photo-preview")
    @bindPhotoPreviewer() if @photo_preview.length > 0

  # well this bind the photo file uploader
  bindPhotoPreviewer: ->
    $(".preview-photo-upload").fileupload
      replaceFileInput: false,
      add: (e, data) =>
        file = data.files[0]
        window.loadImage file, (imgOrError) =>
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

        canvasResize file,
          width: 900,
          height: 400,
          crop: false,
          quality: 80,
          callback: (cdata, width, height) ->
            blob = canvasResize('dataURLtoBlob', cdata)
            blob.name = file.name
            data.files[0] = blob
            $("#photo-form").one "submit", (e) =>
              data.submit()
              e.preventDefault()
              e.stopPropagation()
        true

jQuery ->
  Mightbuy.leadPhotoPreview = new Mightbuy.LeadPhotoPreview()
