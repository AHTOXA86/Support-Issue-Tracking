# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
window.giveAnswer = (id) ->
  $('#myModal').modal()
  $('#answer_ticket_id').val(id)

window.setStatus = (id) ->
  $.ajax
    url: "/tickets/"+id+".json"
    type: "PATCH"
    data:
      ticket:
        status: $('#status_'+id).val()
    success: (response, textStatus, jqXhr) ->
      console.log "Venue Successfully Patched!"
      return

    error: (jqXHR, textStatus, errorThrown) ->

      # log the error to the console
      console.log "The following error occured: " + textStatus, errorThrown
      return

    complete: ->
      console.log "Venue Patch Ran"
      return

window.setOwnership = (id) ->
  $.ajax
    url: "/tickets/"+id+".json"
    type: "PATCH"
    data:
      ticket:
        ownership: $('#ownership_'+id).val()
    success: (response, textStatus, jqXhr) ->
      console.log "Venue Successfully Patched!"
      return

    error: (jqXHR, textStatus, errorThrown) ->

      # log the error to the console
      console.log "The following error occured: " + textStatus, errorThrown
      return

    complete: ->
      console.log "Venue Patch Ran"
      return