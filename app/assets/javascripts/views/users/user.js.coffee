class App.Views.User extends Backbone.View

  tagName: 'tr'

  template: _.template '''
<td><%= id %></td>
<td><%= name %></td>
<td><%= email %></td>
<td>
  <a href="#users/<%= id %>" class="show">Show</a>
  <a href="#users/<%= id %>/edit" class="edit">Edit</a>
  <a href="#users/<%= id %>/delete" class="delete">Delete</a>
</td>
'''

  initialize: ->
    @listenTo(@model, 'destroy', @remove);
    @listenTo(@model, 'change', @render);

  render: ->
    console.log @template
    @$el.html @template(@model.toJSON())
    return @
