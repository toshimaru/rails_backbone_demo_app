class App.Views.UserEdit extends Backbone.View

  el: '#edit-area2'

  template: JST['users/edit']

  events:
    "click .submit" : "submit"

  initialize: ->
    this.render()

    this.$name = this.$('.name')
    this.$email = this.$('.email')
    this.$name.focus()

  submit: (e) ->
    e.preventDefault()

    this.model.save
      name: this.$name.val()
      email: this.$email.val()

    this.$el.hide()

  render: ->
    this.$el.show()
    this.$el.html this.template(this.model.toJSON())
