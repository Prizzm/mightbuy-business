# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

class @Mightbuy.LeadsList
  constructor: ->
    @liveBindEditLeadCancel()

  liveBindEditLeadCancel: ->
    console.info "binding"
    $(".edit-lead-entry .edit-cancel").live 'click', (e) ->
      el = $(e.currentTarget)
      editLeadEntryId = "#" + el.attr("data-edit-lead-entry-id")
      $(editLeadEntryId).remove()
      e.preventDefault()

jQuery ->
  Mightbuy.leadsList = new Mightbuy.LeadsList()
