var request = require('request');
let cheerio = require('cheerio')


request('http://substack.net/images/', function (error, response, body) {
  if (!error && response.statusCode == 200) {
    // console.log(body) // Show the HTML for the Google homepage.
    logging(body)
  }
})


function logging(text){
  var file_permission = []
  let $ = cheerio.load(text)

  $("tr").each(function(){
    // debugger;
    console.log($(this).find('td:first-child').text());
    console.log($(this).find('td:nth-child(3) a').attr('href'));
    console.log($(this).find('td:nth-child(3)').text().split('.').pop());
  })

  // $("tr td:nth-child(3)").each(function(){
  //   // debugger;
  //   console.log($(this).find('href'));
  // })
}


// let $ = cheerio.load('<h2 class="title">Hello world</h2>')
//
// $('h2.title').text('Hello there!')
// $('h2').addClass('welcome')
//
// console.log($.html())
