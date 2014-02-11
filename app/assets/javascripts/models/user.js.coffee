class App.Models.User extends Backbone.Model

  urlRoot: '/users'

  defaults:
    name: 'no name',
    email: 'default email'

  info: ->
    return "id:#{@get('id')}, name:#{@get('name')}, email:#{@get('email')}"
