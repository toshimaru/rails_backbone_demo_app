class App.Routers.Users extends Backbone.Router
  routes:
    "": "index",
    # "todos/:id": "show"

  index: ->
    new App.Views.UsersIndex(collection: new App.Collections.Users())

  start: ->
    Backbone.history.start()
