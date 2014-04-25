# The MainView holds the wrapper template and is used to control rendering
# between the different child views.
template = require "./templates/nav"
session = (require "../utils/session").currentSession
events = (require "../utils/events")
class NavView extends Backbone.View
	events :  
    "click .logout" : "logout"
  
  initialize: =>
    events.on "login", @render
    events.on "logout" , @render
    	
  render : =>
    console.log "session.getuser", session.getUser()
    html = template
            user: session.getUser()
            test : "poupy"
    @$el.html html
  
  logout : =>
    session.logout()

module.exports = NavView
