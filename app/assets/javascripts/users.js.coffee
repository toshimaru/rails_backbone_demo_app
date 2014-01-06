# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->
  $('#show').on 'click', ->
    $.getJSON "/users/1", (data) ->
      console.log data

  $('#show-all').on 'click', ->
    $.getJSON "/users", (data) ->
      console.log data

