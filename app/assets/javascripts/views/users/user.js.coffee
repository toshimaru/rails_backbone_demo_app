class App.Views.User extends Backbone.View

  tagName: 'tr'

  template: JST['users/user']

  events:
    "click .delete" : "delete"

  initialize: ->
    @listenTo(@model, 'destroy', @remove);
    @listenTo(@model, 'change', @render);

  delete: (e) ->
    e.preventDefault()
    @model.destroy() if confirm 'Are you sure to delete?'

  render: ->
    @$el.html @template(@model.toJSON())
    return @
