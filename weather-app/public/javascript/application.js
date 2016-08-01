$(document).ready(function() {
  // debugger
  var BASE_URL = 'http://autocomplete.wunderground.com/aq?query='
  var ACCESS_KEY = 'd3af72d439789319'

  $("#finding-cities").on('submit', function(e){
    e.preventDefault();
    query = $("#city").val();
    $.ajax({
      url: 'http://autocomplete.wunderground.com/aq?query=' + query,
      dataType: "jsonp",
      success: function(data){
        debugger
        console.log(data);
      },
      error: function(data){
        debugger
        console.log(data)
        console.log("NOOOOO")
      }
    });

  })

  // function logResults(json){
  //   console.log(json);
  //   console.log("hi")
  // }

  // var city = {
  //   getCities: function(query){
  //       return $.ajax({
  //         url: BASE_URL + query,
  //         dataType: 'jsonp'
  //         // headers: { 'Authorization': 'Token ' + ACCESS_KEY }
  //       })
  //   }
  // }
  // console.log(city.getCities)
//
//   function logData(data) {
//     console.log(data)
//     return data
//   }
//
//   function displayStoreData(data) {
//     $('.newcontainer')
//     .empty() // Clear container contents first
//     .html(stores_template(data))
//     return data
// }

});



// $.ajax({
//   url:"http://autocomplete.wunderground.com/aq?query="+query,
//   dataType
//   debugger
//   });
