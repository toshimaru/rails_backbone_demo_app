class App.Controllers.Users extends Backbone.Marionette.Controller

  constructor: ->
    @edit_view = new App.Views.UserEdit()
    @collection = new App.Collections.Users()
    @user_index_view = new App.Views.UsersIndex(collection: @collection)
    @collection.fetch(reset: true)
    Backbone.history.start()

  index: ->
    console.log "index"

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
    Backbone.history.navigate ''
