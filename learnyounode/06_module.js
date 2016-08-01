var fs = require('fs')
var pth = require('path')

module.exports = function finding_files(filename, extension_filter, callback){

  listing = []
  var extension = "." + extension_filter
  fs.readdir(filename, function finishlisting(err, list){
    if (err){
      // console.log("hi")
      return callback(err, null)
    }
    // console.log(list)
    for (var i = 0; i < list.length; i++) {
      if (pth.extname(list[i]) === extension){
        // console.log(list[i])
        listing.push(list[i])
      }
    }
    return callback(null,listing);
  });
}



// finding_files(process.argv[2], process.argv[3], logging)
