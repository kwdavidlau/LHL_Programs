
  // var fs = require('fs')
  // var pth = require('path')
  // var listing = []
  // var extension = "." + process.argv[3]

function finding_files(callback){
  var fs = require('fs')
  var pth = require('path')

  var listing = []
  var extension = "." + process.argv[3]
  fs.readdir(process.argv[2], function finishlisting(err, list){
    for (var i = 0; i < list.length; i++) {
      if (pth.extname(list[i]) === extension){
        console.log(list[i])
      }
    }
    callback();
  });
}


function logging(){
  for (var i = 0; i < listing.length; i++) {
    console.log(listing[i])
  }
}


finding_files(logging)
// console.log(process.argv)
