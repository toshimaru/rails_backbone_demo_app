# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->
  appView = new App.Views.UsersIndex(collection: new App.Collections.Users())

### Version. 2
  # use Collection
  $('#show-all').on 'click', ->
    users = new App.Collections.Users
    users.fetch
      success: ->
        console.log users.get 5
      error: ->
        alert 'fetch error!'

  # use Model
  $('#show').on 'click', ->
    user = new App.Models.User
    user.url = '/users/4'
    user.fetch
      success: ->
        console.log user.get('email')
      error: ->
        alert 'fetch error!'

  # fetch data -> update data
  $('#edit').on 'click', ->
    user = new App.Models.User
    user.url = '/users/4'
    user.fetch
      success: ->
        new_name = $('#new-name').val()
        user.save({ name: new_name }, { patch: true })
          success: ->
            alert 'success'
          error: ->
            alert 'error'
      error: ->
        alert 'fetch error!'

  # create new user
  $('#create').on 'click', ->
    user = new App.Models.User
    user.url = '/users'
    new_name = $('#create-new-name').val()
    user.save({ name: new_name, email: 'my@address.com' }, { patch: true })
      success: ->
        alert 'success'
      error: ->
        alert 'error'

  # fetch data -> delete data
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
###

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
