class App.Views.User extends Backbone.View

  tagName: 'tr'

  template: JST['users/user']

  events:
    "click .edit" : "edit"
    "click .delete" : "delete"

  initialize: (options) ->
    @listenTo(@model, 'destroy', @remove);
    @listenTo(@model, 'change', @render);

    @editView = options.editView

  edit: (e) ->
    e.preventDefault()
    @editView.render @model

  delete: (e) ->
    e.preventDefault()
    @model.destroy() if confirm 'Are you sure to delete?'

  render: ->
    @$el.html @template(@model.toJSON())
    return @
