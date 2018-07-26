csv = require 'fast-csv'
sharinpix = require 'sharinpix'
superagent = require 'superagent'
async = require 'async'
_ = require 'lodash'

rename = (path) ->
  stream = fs.createReadStream path
  albums = []

  csv
  .fromStream stream, headers: true
  .on "data", (data)->
    origin_id = data['origin_id']
    destination_id = data['destination_id']
    url = '/albums/'+origin_id+'?merge=true'
    endpoint = sharinpix.get_instance().api_url(url)
    abilities=
      admin: true
    token = sharinpix.get_instance().token abilities
    albums.push async.reflect((callback)->
      body=
      'album':
        'public_id': destination_id
      superagent
        .put(endpoint)
        .set 'Authorization', "Token token=\"#{token}\""
        .set 'Accept', 'application/json'
        .send body
        .then (res)->
          console.log [origin_id, destination_id].join(',')
        ,(err)->
          console.error [origin_id, destination_id].join(',')
    )
  .on "end", ->
    async.parallelLimit albums, 10
module.exports = rename
