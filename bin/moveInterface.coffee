moveAlbum = require '../moveAlbum.js'
fs = require 'fs'

module.exports = ->
  if process.env.SHARINPIX_URL
    if process.argv.length is 3
      filePath = process.argv[2]

      if fs.existsSync(filePath)
        moveAlbum filePath
      else
        console.error "Error: Could not find file #{ filePath }."
    else
      console.error 'Error: Expected atleast 1 argument. E.g: sharinpix-move sample.csv > success.csv 2> error.csv'
  else
    console.error 'Environment variable SHARINPIX_URL is incorrect.'