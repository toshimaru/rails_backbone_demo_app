class App.Routers.Users extends Backbone.Router

  routes:
    "": "index",
    "users/:id": "show"
    "users/:id/edit": "edit"
    "users/:id/delete": "delete"

  initialize: ->
    @edit_view = new App.Views.UserEdit()
    @collection = new App.Collections.Users()
    @user_index_view = new App.Views.UsersIndex(collection: @collection)
    @collection.fetch(reset: true)

  start: ->
    Backbone.history.start()

  show: (id) ->
    if @collection.length > 0
      model = @collection.get id
      alert model.info()
    else
      @id = id
      @listenTo(@collection, 'reset', @showOne)

  showOne: ->
    model = @collection.get @id
    alert model.info()

  edit: (id) ->
    if @collection.length > 0
      model = @collection.get id
      @edit_view.render model
    else
      @id = id
      @listenTo(@collection, 'reset', @editOne)

  editOne: ->
    model = @collection.get @id
    @edit_view.render model

  delete: (id) ->
    @collection.get(id).destroy() if confirm 'Are you sure to delete?'
    @navigate ''
