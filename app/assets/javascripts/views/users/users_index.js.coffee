class App.Views.UsersIndex extends Backbone.View

  el: '#user-view'

  template: JST['users/index']

  events:
    "click .submit" : "new"
    "keypress input" : "newOnEnter"

  initialize: ->
    this.listenTo(this.collection, 'add', this.addOne)
    this.listenTo(this.collection, 'reset', this.addAll)

    this.$table = this.$('#data-table')
    this.$name = this.$('.name')
    this.$email = this.$('.email')

    this.collection.fetch(reset: true)

  newOnEnter: (e) ->
    if e.which == ENTER_KEY
      this.new(e)

  new: (e) ->
    e.preventDefault()

    this.collection.create
      name: this.$name.val()
      email: this.$email.val()

    this.$name.val ''
    this.$email.val ''

  addAll: ->
    this.collection.each(this.addOne, this)

  addOne: (model) ->
    user = new App.Views.User(model: model)
    this.$table.append user.render().el
