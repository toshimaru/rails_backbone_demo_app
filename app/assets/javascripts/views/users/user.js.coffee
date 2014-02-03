class App.Views.User extends Backbone.View

  tagName: 'tr'

  template: JST['users/user']

  events:
    "click .show" : "show"

  initialize: ->
    # this.listenTo this.model, 'event name' this.render

  show: (e) ->
    e.preventDefault()
    alert this.model.info()

  render: ->
    this.$el.append this.template this.model.toJSON()
    return this
