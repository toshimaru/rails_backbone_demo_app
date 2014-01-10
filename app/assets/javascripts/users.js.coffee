# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->

  # TODO: save accepts success and error callbacks in the options hash,

  # use Collection
  $('#show-all').on 'click', ->
    users = new App.Collections.Users
    users.fetch().done ->
      console.log users.get 5

  # use Model
  $('#show').on 'click', ->
    user = new App.Models.User
    user.url = '/users/4'
    user.fetch().done ->
      console.log user.get('email')

  # fetch data -> update data
  $('#edit').on 'click', ->
    user = new App.Models.User
    user.url = '/users/4'
    user.fetch().done ->
      new_name = $('#new-name').val()
      user.save({ name: new_name }, { patch: true }).done ->
          alert 'success'
        .fail ->
          alert 'error'

  $('#create').on 'click', ->
    user = new App.Models.User
    user.url = '/users'
    new_name = $('#create-new-name').val()
    user.save({ name: new_name, email: 'my@address.com' }, { patch: true }).done ->
        alert 'success'
      .fail ->
        alert 'error'

  $('#delete').on 'click', ->
    user = new App.Models.User
    user.url = '/users/6'
    user.fetch
      success: ->
        user.destroy
          success: ->
            alert 'success'
          error: ->
            alert 'error'
      error: ->
        alert 'fetch error'

### Version. 1
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
###
