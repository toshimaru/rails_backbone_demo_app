class App.Views.User extends Backbone.View

  tagName: 'tr'

  template: JST['users/user']

  events:
    "click .show" : "show"
    "click .edit" : "edit"
    "click .delete" : "delete"

  initialize: ->
    this.listenTo(this.model, 'destroy', this.remove);

  show: (e) ->
    e.preventDefault()
    alert this.model.info()

  edit: (e) ->
    e.preventDefault()
    $editarea = $('#edit-area')
    $editarea.show()
    $editarea.find('.name').val this.model.get 'name'
    $editarea.find('.email').val this.model.get 'email'

  delete: (e) ->
    e.preventDefault()
    this.model.destroy() if confirm 'Are you sure to delete?'

  render: ->
    this.$el.append this.template(this.model.toJSON())
    return this
