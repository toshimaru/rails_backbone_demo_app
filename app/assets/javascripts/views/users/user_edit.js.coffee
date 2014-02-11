class App.Views.UserEdit extends Backbone.View

  el: '#edit-area2'

  template: JST['users/edit']

  events:
    "click .submit" : "submit"
    "keypress input" : "submitOnEnter"

  initialize: ->
    @render()

    @$name = @$('.name')
    @$email = @$('.email')
    @$name.focus()

  submitOnEnter: (e) ->
    if e.which == ENTER_KEY
      @submit(e)

  submit: (e) ->
    e.preventDefault()

    @model.save
      name: @$name.val()
      email: @$email.val()

    @$el.hide()

  render: ->
    @$el.show()
    @$el.html @template(@model.toJSON())
