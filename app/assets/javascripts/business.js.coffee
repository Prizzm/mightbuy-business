# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

class @Mightbuy.Business
  constructor: ->
    if $(".more-url").length > 0
      $(".more-url").click @addMoreURL

    $(".add-product-btn").live('click',@showAddProduct)
    $(".product-create-cancel").live('click', -> $(".add-product-row").hide())
    $(".product-edit-cancel").live('click', -> $(".edit-product-row").remove())
    $("#business_config_liability").markItUp(@markdownSettings())

  markdownSettings: ->
    {
      nameSpace:          'markdown',
      onShiftEnter:       {keepDefault:false, openWith:'\n\n'},
      markupSet: [
          {name:'First Level Heading', key:"1", placeHolder:'Your title here...', closeWith: (markItUp) -> return miu.markdownTitle(markItUp, '=') },
          {name:'Second Level Heading', key:"2", placeHolder:'Your title here...', closeWith: (markItUp) -> return miu.markdownTitle(markItUp, '-') },
          {name:'Heading 3', key:"3", openWith:'### ', placeHolder:'Your title here...' },
          {name:'Heading 4', key:"4", openWith:'#### ', placeHolder:'Your title here...' },
          {name:'Heading 5', key:"5", openWith:'##### ', placeHolder:'Your title here...' },
          {name:'Heading 6', key:"6", openWith:'###### ', placeHolder:'Your title here...' },
          {separator:'---------------' },
          {name:'Bold', key:"B", openWith:'**', closeWith:'**'},
          {name:'Italic', key:"I", openWith:'_', closeWith:'_'},
          {separator:'---------------' },
          {name:'Bulleted List', openWith:'- ' },
          {name:'Numeric List', openWith: (markItUp) ->
              return markItUp.line+'. ';
          }
      ]
    }

  addMoreURL: ->
    next_counter = $(".business-urls input[type='text']").length
    $(".business-urls").append($(JST["templates/add_url"]({counter: next_counter})))
    $(".less-url").click ->
      $(this).parent("div").remove()

  showAddProduct: =>
    $(".add-product-row").toggle()

jQuery ->
  new Mightbuy.Business()
