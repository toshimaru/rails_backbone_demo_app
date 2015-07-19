class App.Routers.Users extends Backbone.Marionette.AppRouter

  # controller: new App.Controllers.Users

  appRoutes:
    "": "index"
    ":id": "show"
    ":id/edit": "edit"
    ":id/delete": "delete"
