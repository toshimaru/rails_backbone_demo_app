class App.Views.User extends Backbone.View

  tagName: 'tr'

  template: JST['users/user']

  events:
    "click .edit" : "edit"
    "click .delete" : "delete"

  initialize: ->
    @listenTo(@model, 'destroy', @remove);
    @listenTo(@model, 'change', @render);

  edit: (e) ->
    e.preventDefault()
    userEdit = new App.Views.UserEdit(model: @model)

  delete: (e) ->
    e.preventDefault()
    @model.destroy() if confirm 'Are you sure to delete?'

  render: ->
    @$el.html @template(@model.toJSON())
    return @
