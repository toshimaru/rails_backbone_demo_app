class App.Views.UserEdit extends Backbone.View

  el: '#edit-area'

  template: _.template '''
<input type="text" placeholder="name" value="<%= name %>" class="name"><br>
<input type="text" placeholder="email" value="<%= email %>" class="email"><br>
<input type="submit" value="Submit" class="submit">
'''

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
    console.log @template
    @model = model
    @listenTo(@model, 'destroy', @remove);

    @$el.show()
    @$el.html @template(@model.toJSON())

    @$name = @$('.name')
    @$email = @$('.email')
    @$name.focus()
