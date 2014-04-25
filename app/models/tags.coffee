class TagModel extends Backbone.Model
  idAttribute: '_id'

  urlRoot: ->
    window.CONFIG.server + '/api/tags'

module.exports = TagModel