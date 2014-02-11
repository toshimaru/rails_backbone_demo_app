class App.Routers.Users extends Backbone.Router
  routes:
    "": "index",
    "users/:id": "show"

  initialize: ->
    @collection = new App.Collections.Users()
    new App.Views.UsersIndex(collection: @collection)
    @collection.fetch(reset: true)

  index: ->
    # ...

  start: ->
    Backbone.history.start()

  show: (id) ->
    if @collection.length > 0
      model = @collection.get id
      alert model.info()
    else
      @user = new App.Models.User(id: id)
      @listenTo(@user, 'sync', @showOne)
      @user.fetch()

  showOne: ->
    alert @user.info()
