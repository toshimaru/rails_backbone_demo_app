class App.Views.UsersIndex extends Backbone.View

  el: '#data-table'

  template: JST['users/index']

  initialize: ->
    this.listenTo(this.collection, 'reset', this.addAll);
    this.collection.fetch(reset: true)

  addAll: ->
    console.log 'addAll!'
    this.collection.each this.addOne, this

  addOne: (model) ->
    user = new App.Views.User model: model
    this.$el.append user.render().el;
