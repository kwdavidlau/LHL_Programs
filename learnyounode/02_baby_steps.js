x = process.argv
x.splice(0,2)
var sum = 0
for (var i = 0; i < x.length; i++) {
  // console.log(x[i])
  sum += parseInt(x[i])
}

console.log(sum)
