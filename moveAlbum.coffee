csv = require 'fast-csv'
sharinpix = require 'sharinpix'
superagent = require 'superagent'
async = require 'async'
_ = require 'lodash'
fs = require 'fs'

module.exports = (path) ->
  q = async.queue((task, callback)->
    line = "#{task.src},#{task.dst}"
    sharinpix
      .get_instance()
      .put(
        "/albums/#{task.src}?merge=true",
        {
          album:
            public_id: task.dst
        }
      ).then((res)->
        console.log line
        callback()
      , (err)->
        console.error line
        callback()
      )
  , 10)
  csv
    .fromStream(fs.createReadStream(path))
    .on "data", (data)->
      q.push(src: data[0], dst: data[1])
