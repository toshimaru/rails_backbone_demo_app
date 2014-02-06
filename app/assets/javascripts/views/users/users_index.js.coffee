class App.Views.UsersIndex extends Backbone.View

  el: '#user-view'

  template: JST['users/index']

  events:
    "click .submit" : "submit"

  initialize: ->
    this.listenTo(this.collection, 'reset', this.addAll);;

    this.$table = this.$('#data-table')

    this.collection.fetch(reset: true)

  addAll: ->
    this.collection.each(this.addOne, this)

  submit: ->
    alert 'submit'

  addOne: (model) ->
    user = new App.Views.User(model: model)
    this.$table.append user.render().el
