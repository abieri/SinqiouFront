class UserModel extends Backbone.Model
  idAttribute: '_id'

  urlRoot: ->
    window.CONFIG.server + '/api/user'

module.exports = UserModel