class App.Models.User extends Backbone.Model

  urlRoot: '/users'

  defaults:
    name: 'no name',
    email: 'default email'

  info: ->
    return 'id: ' + this.get('id') + ', name: ' + this.get('name') + ', email: ' + this.get('email')
