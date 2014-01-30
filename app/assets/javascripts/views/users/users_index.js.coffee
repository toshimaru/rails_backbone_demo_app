class App.Views.UsersIndex extends Backbone.View

  el: '#backbone-view'

  template: JST['users/index']

  initialize: ->
    this.listenTo(this.collection, 'sync', this.render);
    this.collection.fetch()

  render: ->
    console.log this.collection.toJSON()
    this.$el.html this.template(users: this.collection.toJSON())
