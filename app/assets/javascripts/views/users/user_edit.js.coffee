class App.Views.UserEdit extends Backbone.View

  el: '#edit-area2'

  template: JST['users/edit']

  events:
    "blur .name" : "clear"

  initialize: ->
    this.render()

    this.$name = this.$('.name')
    this.$name.focus()

  clear: ->
    alert 'clear'

  render: ->
    this.$el.append this.template()
