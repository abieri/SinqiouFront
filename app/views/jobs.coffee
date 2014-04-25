# The MainView holds the wrapper template and is used to control rendering
# between the different child views.
template = require "./templates/jobs"
events = require "../utils/events"
class JobsView extends Backbone.View

  # Add the html from the corresponding template and create the child views
  # Set the height on this element to avoid the app awkwardly resizing when
  # the keyboard is active
  templateJob : '<div class="panel panel-default"><div class="panel-heading"><h3 class="panel-title">{0}</h3></div><div class="panel-body"><p>{1}</p><p> Ville : {2}<p></div></div>'

  jobs : [
    {
      title : "Java developper",
      descriptions : "Amazing job, java devleopper,Amazing job, java devleopper,Amazing job, java devleopper,Amazing job, java devleopper",
      tags : ["Java"],
      location : {
        city : "Sydney",
        coordinates : [151.472522737, -33.3749757147]
      },
    },
    {
      title : "Java developper",
      descriptions : "Amazing job, java devleopper,Amazing job, java devleopper,Amazing job, java devleopper,Amazing job, java devleopper",
      tags : ["Java"],
      location: {
        "city" : "Sydney",
        coordinates :[
          151.472522737,
          -33.3749757147
        ]
      }
    },
    {
      title : "Java developper",
      descriptions : "Amazing job, java devleopper,Amazing job, java devleopper,Amazing job, java devleopper,Amazing job, java devleopper",
      tags : ["Java"],
      location: {
        "city" : "Sydney",
        coordinates :[
          151.472522737,
          -33.3749757147
        ]
      }
    } 
  ]

  
    
            



  display: ()=>
    if @map? 
      @renderJobs @jobs
    


  initialize: =>
    
    
  renderJobs:(jobs)=>
    $("#job-container").empty()
    for job in jobs
      html = @templateJob.replace("{0}", job.title).replace("{1}", job.descriptions).replace("{2}", job.location.city)
      $("#job-container").append html
      m = new google.maps.Marker
        map:       @map,
        animation: google.maps.Animation.DROP,
        title:     job.title,
        position:  new google.maps.LatLng job.location.coordinates[1],job.location.coordinates[0],
        
      google.maps.event.addListener m, 'click', () =>
        info_window = new google.maps.InfoWindow()
        info_window.setContent '<p><strong>#{this.title}</strong></p>'
        info_window.open(@map, this);
  render : =>

    @$el.html(template())
    that = @
    events.on "map-loaded" ,(data) ->
      that.map = data
      that.renderJobs that.jobs
    initMaps = ()=>

      
      mapOptions = 
        zoom: 2,
        center: new google.maps.LatLng(48.853607, 2.345429)
        
      map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions);
      console.log "before trigger"
      events.trigger "map-loaded",map
      
    google.maps.event.addDomListener(window, 'load', initMaps);
    initMaps()


  
module.exports = JobsView
