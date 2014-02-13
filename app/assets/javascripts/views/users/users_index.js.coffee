class App.Views.UsersIndex extends Backbone.View

  el: '#user-view'

  template: JST['users/index']

  events:
    "click .submit" : "new"
    "keypress input" : "newOnEnter"

  initialize: ->
    @listenTo(@collection, 'add', @addOne)
    @listenTo(@collection, 'reset', @addAll)

    @editView = new App.Views.UserEdit()

    @$table = @$('#data-table')
    @$name = @$('.name')
    @$email = @$('.email')

  newOnEnter: (e) ->
    if e.which == ENTER_KEY
      @new(e)

  new: (e) ->
    e.preventDefault()

    @collection.create
      name: @$name.val()
      email: @$email.val()

    @resetInput()

  resetInput: ->
    @$name.val ''
    @$email.val ''

  addAll: ->
    @collection.each(@addOne, @)

  addOne: (model) ->
    user = new App.Views.User(model: model, editView: @editView)
    @$table.append user.render().el
