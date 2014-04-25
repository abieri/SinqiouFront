try
  config = 
		"server":"http://localhost:3000"
  window.CONFIG = config
catch error
  console.error "Error loading configuration"
  $(".wrapper").html('Configuration file not found...')
