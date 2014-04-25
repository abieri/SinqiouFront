Model = require "../models/tags" 

class TagsCollection extends Backbone.Collection
  model: Model

  url: ->
    CONFIG.server + "/api/tags/list"


module.exports = TagsCollection