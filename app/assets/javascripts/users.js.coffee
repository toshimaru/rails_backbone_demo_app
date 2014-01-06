# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->

  $('#show-all').on 'click', ->
    $.getJSON "/users", (data) ->
      console.log data

  $('#show').on 'click', ->
    $.getJSON "/users/1", (data) ->
      console.log data

  $('#edit').on 'click', ->
    new_name = $('#new-name').val()
    $.ajax("/users/1.json",
      type: 'patch'
      data:
        user:
          name: new_name
      ).done (response) ->
        alert 'success'
      .fail (response) ->
        alert 'error'

  $('#delete').on 'click', ->
    $.ajax("/users/2.json",
      type: 'delete'
      ).done (response) ->
        alert 'success'
      .fail (response) ->
        alert 'error'
