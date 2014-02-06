class App.Views.UserEdit extends Backbone.View

  template: JST['users/edit']

  events:
    "click .delete" : "delete"

  initialize: ->
    # this.listenTo(this.model, 'destroy', this.remove);
