var fs = require('fs')

x = fs.readFileSync(process.argv[2])
console.log((x.toString().match(/\n/g) || []).length); //logs 3
