// function


var fs = require('fs')
function callbacks (callb){
    fs.readFile(process.argv[2], function donereading(err,filecontents){
      x = (filecontents.toString().match(/\n/g) || []).length;
      callb();
    })
}

function logging (){
  console.log(x)
}

callbacks(logging)

// console.log(x)
// console.log((x.toString().match(/\n/g) || []).length);
