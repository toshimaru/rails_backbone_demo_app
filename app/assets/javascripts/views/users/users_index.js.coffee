class App.Views.UsersIndex extends Backbone.View

  el: '#backbone-view'

  template: JST['users/index']

  events:
    "click .show" : "show"

  initialize: ->
    this.listenTo(this.collection, 'sync', this.render);

    this.collection.fetch()

  show: (e) ->
    e.preventDefault()
    alert('show')

  render: ->
    # TODO: create model
    console.log this.collection.toJSON()
    this.$el.html this.template users: this.collection.toJSON()
