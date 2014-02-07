class App.Views.User extends Backbone.View

  tagName: 'tr'

  template: JST['users/user']

  events:
    "click .show" : "show"
    "click .edit" : "edit"
    "click .delete" : "delete"

  initialize: ->
    this.listenTo(this.model, 'destroy', this.remove);
    this.listenTo(this.model, 'change', this.render);

  show: (e) ->
    e.preventDefault()
    alert this.model.info()

  edit: (e) ->
    e.preventDefault()
    console.log this.model
    userEdit = new App.Views.UserEdit(model: this.model)

  delete: (e) ->
    e.preventDefault()
    this.model.destroy() if confirm 'Are you sure to delete?'

  render: ->
    this.$el.html this.template(this.model.toJSON())
    return this
