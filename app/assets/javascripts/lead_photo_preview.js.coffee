class @Mightbuy.LeadPhotoPreview
  constructor: ->
    @photo_preview = $("#lead-photo-preview")
    @bindPhotoPreviewer() if @photo_preview.length > 0

  # well this bind the photo file uploader
  bindPhotoPreviewer: ->
    $("#customer_lead_photo").fileupload
      replaceFileInput: false,
      add: (e, data) =>
        window.loadImage data.files[0], (imgOrError) =>
          if imgOrError.type != "error"
            @image = $(imgOrError)

            previewWidth  = @photo_preview.width()
            previewHeight = @photo_preview.height()
            imageWidth    = @image.attr("width")
            imageHeight   = @image.attr("height")

            if  imageWidth > previewWidth
              @image.attr("width", previewWidth).css("width", "#{previewWidth}px")
            else
              @image.css("margin-left", (previewWidth - imageWidth)/2)

            if imageHeight > previewHeight
              @image.attr("height", previewHeight).css("height", "#{previewHeight}px")
            else
              @image.css("margin-top", (previewHeight - imageHeight)/2)

            @photo_preview.html @image
        true

jQuery ->
  Mightbuy.leadPhotoPreview = new Mightbuy.LeadPhotoPreview()
