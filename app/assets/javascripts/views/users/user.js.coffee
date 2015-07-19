class App.Views.User extends Backbone.View

  tagName: 'tr'

  template: $('#userdata-template').html()

  initialize: ->
    @listenTo(@model, 'destroy', @remove);
    @listenTo(@model, 'change', @render);

  render: ->
    @$el.html Mustache.render(@template, @model.toJSON())
    return @
