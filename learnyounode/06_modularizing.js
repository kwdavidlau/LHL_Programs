var mymodule = require('./06_module.js')

function logging(item, data){
  if (item) {
    // console.log('hi')
    console.log(item)
  }
  else {
    // console.log(data)
    for (var i = 0; i < data.length; i++) {
      console.log(data[i])
    }
  }
}

// console.log(mymodule)
mymodule(process.argv[2], process.argv[3], logging)
