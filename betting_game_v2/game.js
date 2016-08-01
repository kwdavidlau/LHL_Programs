var prompt = require('prompt-sync')

$(document).ready(function(){
  $("p").click(function(){
    $(this).hide();
  });
});

var total = 100;
$(document).ready(function(){
  // pics = Math.floor(total/20);
  // while (pics > 0 ){
  //   $("body").prepend('<img id="theImg" src="money.png" />');
  //   pics -= 1;
  // }
  $("#enter").click(function(event){
    event.preventDefault();

    var random_num = Math.floor((Math.random() * 10) + 1);
    var bet = $("#bet").val();
    var guess = $("#number").val();

    // var bet = parseInt($(this).serializeArray()[0].value);
    // var guess = parseInt($(this).serializeArray()[1].value);

    if (guess === random_num){
      total += bet;
      console.log("Good job, number was indeed " + random_num);
      $("p").text(total);
    }
    else if (Math.abs(guess-random_num) === 1 ){
      console.log("You don't gain or lose shit... the number was " + random_num);
      $("p").text(total);
    }
    else {
      total -= bet;
      console.log("Number was " + random_num);
      $("p").text(total);
    }
    if (total <= 0){
      $("#enter")[0].disabled = true;
      $("#restart")[0].disabled = false;
      $("p").text(0);
    }


  });

  $("#enter").click(function(event){

  });
});
