class App.Views.UserEdit extends Backbone.View

  el: '#edit-area'

  template: $('#edit-template').html()

  events:
    "click .submit" : "submit"
    "keypress input" : "submitOnEnter"

  initialize: ->

  submitOnEnter: (e) ->
    if e.which == ENTER_KEY
      @submit(e)

  submit: (e) ->
    e.preventDefault()

    @model.save
      name: @$name.val()
      email: @$email.val()

    @$el.hide()

  render: (model) ->
    @model = model
    @listenTo(@model, 'destroy', @remove);

    @$el.show()
    @$el.html Mustache.render(@template, @model.toJSON())

    @$name = @$('.name')
    @$email = @$('.email')
    @$name.focus()
