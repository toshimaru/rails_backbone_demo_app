class App.Routers.Users extends Backbone.Router
  routes:
    "": "index",
    "users/:id": "show"

  initialize: ->
    this.collection = new App.Collections.Users()
    new App.Views.UsersIndex(collection: this.collection)
    this.collection.fetch(reset: true)

  index: ->
    # ...

  start: ->
    Backbone.history.start()

  show: (id) ->
    if this.collection.length > 0
      model = this.collection.get id
      alert model.info()
    else
      this.user = new App.Models.User(id: id)
      this.listenTo(this.user, 'sync', this.showOne)
      this.user.fetch()

  showOne: ->
    alert this.user.info()
