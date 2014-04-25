events = require "./events"
class Session
  
  setUser :(user) =>
    localStorage.setItem "sinqiuser", JSON.stringify(user)

  getUser :() =>
	  try 
  		JSON.parse(localStorage.getItem "sinqiuser")
  	catch err
  		return null
  logout : () =>
    localStorage.removeItem "sinqiuser"
    events.trigger "logout"
  login :  (nickname, password,  done) =>
    params =
  		nickname : nickname
  		password : password

    options = 
      type: 'post',
      dataType: "json",
      xhrFields: 
        withCredentials: true
      data: params,
      url: window.CONFIG.server + "/api/login",
      success: (data) =>
      	if data?.auth and data?.user
      		@setUser data?.user
      		events.trigger "login"

        return done(null, data);	
      
      error: (err) =>
        return done(new Error("LoginFailed."));
      
    
    $.ajax(options);
  

module.exports.currentSession = new Session()