class App.Views.User extends Backbone.View

  tagName: 'tr'

  template: JST['users/user']

  initialize: ->
    @listenTo(@model, 'destroy', @remove);
    @listenTo(@model, 'change', @render);

  render: ->
    @$el.html @template(@model.toJSON())
    return @
