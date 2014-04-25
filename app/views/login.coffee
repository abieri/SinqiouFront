# The MainView holds the wrapper template and is used to control rendering
# between the different child views.
template = require "./templates/login"
session = require("../utils/session").currentSession
class LoginView extends Backbone.View

  # Add the html from the corresponding template and create the child views
  # Set the height on this element to avoid the app awkwardly resizing when
  # the keyboard is active
  events :
  	"click .signin" : "login"
  login : =>
  	nickname = $("#inputUsername").val()
  	password = $("#loginPassword").val()
  	session.login nickname, password, (err, result)=>
  		if err
  			return
  		if result?.auth and result.user?
  			window.location.hash = "#home"









  initialize: ->
  	@redirect = "home"

    
    
  render : =>

    @$el.html(template())

  
module.exports = LoginView
