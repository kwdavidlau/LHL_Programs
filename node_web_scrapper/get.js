var request = require('request');
let cheerio = require('cheerio')
var fs = require('fs')
var csvWriter = require('csv-write-stream')
var writer = csvWriter({ headers: ["permissions", "link", "link type"]})

request('http://substack.net/images/', function (error, response, body) {
  if (!error && response.statusCode == 200) {
    // console.log(body) // Show the HTML for the Google homepage.
    logging(body)
  }
})


function logging(text){
  var file_permission = []
  let $ = cheerio.load(text)
  writer.pipe(fs.createWriteStream('out.csv'))

  $("tr").each(function(){
    var permission = $(this).find('td:first-child').text();
    var link = $(this).find('td:nth-child(3) a').attr('href');
    var imagetype = $(this).find('td:nth-child(3)').text().split('.').pop();
    writer.write([permission, link, imagetype])
    // file_permission = permission + ',' + link + ',' + imagetype
    // console.log(file_permission)
  })
  writer.end()
}






// let $ = cheerio.load('<h2 class="title">Hello world</h2>')
//
// $('h2.title').text('Hello there!')
// $('h2').addClass('welcome')
//
// console.log($.html())
