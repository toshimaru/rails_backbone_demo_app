# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->
  new App.Routers.Users(controller: new App.Controllers.Users())

# Marionette start
  # UserApp = new Backbone.Marionette.Application()
  # UserApp.addRegions
  #   'header': 'header'
  #   'main':   '#main'
  #   'footer': 'footer'
  #
  # UserApp.on 'start', ->
  #   alert "started!"
# Marionette end
