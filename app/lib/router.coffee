# The app router watches the browser's navigation and plugs to the
# corresponding action on the mainView

ViewManager = require("./vm")
NavView = require("../views/nav")
HeaderView = require("../views/header")

class AppRouter extends Backbone.Router

  preload : (callback)=>
    views = [
      {
        name : "home"
      },
      {
        name : "about"
        
      },

      {
        name : "createuser"
        
      },
      {
        name : "activateuser"
        
      },
      {
        name : "login"
        
      },
      {
        name : "jobs"
        
      }
      
    ]
    @vm.preloadViews views, callback
    
    
    #by default we lock the autorotate
  initialize:(callback) ->
    @vm = new ViewManager 
      viewpath : "../views/"

    @preload ()=>
      @navBar = new NavView
        el : $('.nav')
      @headerView = new HeaderView
        el : $('.header')
      @navBar.render()
      @headerView.render()
      callback()

  # Bind the routes to their corresponding methods
  routes:
    
    "home" :"home"
    "about" : "about"
    "jobs" : "jobs"
    "user/login" : "login"
    "user/create" : "createUser"
    "user/activate/:id" : "activateUser"
    "*actions": "home"

  jobs :() ->
    @vm.showView "jobs"
  login :() ->
    @vm.showView "login"

  activateUser :(id) ->
    @vm.showView "activateuser",
      id : id
  createUser :() ->
    @vm.showView "createuser"

  about :() ->
    @vm.showView "about"

  
  home :() ->
    @vm.showView "home",
      lockview : true
module.exports = AppRouter
