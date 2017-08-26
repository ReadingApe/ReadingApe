# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).on "turbolinks:load", ->

  $("main").on "ajax:success", "form#new_comment", (event) ->
    [response, status, xhr] = event.detail
    $(this).trigger("reset")
  $("main").on "ajax:error", "form#new_comment", (event) ->
    [response, status, xhr] = event.detail
    return ! confirm "Error, cannot save: " + status
  $("main").on "ajax:complete", "form#new_comment", (event) ->
    [xhr, status] = event.detail
    $(this).off( "submit" )

  true
