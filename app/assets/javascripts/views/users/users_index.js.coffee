class App.Views.UsersIndex extends Backbone.View

  el: '#backbone-view'

  template: JST['users/index']

  render: ->
    this.$el.html this.template
      users: [
        { 'name': 'toshi', 'email': 'mail@abc.com' }
        { 'name': 'toshi2', 'email': 'mail@def.com' }
      ]
