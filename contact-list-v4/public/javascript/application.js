$(document).ready(myApp);

function myApp() {

  changeStateTo('list');
  // debugger
  /////////////////////////
  // changing pages
  function changeStateTo(state, needed_data){
    if (state === 'list'){
      $('.table').show();
      $("#new-contact").hide();
      $("#single-contact").hide();
    } else if (state === 'create'){
        $('.table').hide();
        $("#single-contact").hide();
        $("#new-contact").show();
    } else if (state === 'edit'){
      $('.table').hide();
      $("#single-contact").show();
      printdata(needed_data);
      }
    }

  ///////////////
  //////////////////////////////
  // loading contacts on index page
  // Default is to load the list of contacts.
  $(".list-of-contacts").on("click", indexButtonClick);
  $("h1").on("click", loadDataFromTheBackend);

  // Go to the backend and load data.
  function loadDataFromTheBackend() {
    // debugger
    $("#contact-table").empty();
    $.getJSON('/contacts', loadContactOnTheTable);
  }

  // Loop throgh each client from database and add row.
  function loadContactOnTheTable(data){
    $.each(data, addContactRow);
    // debugger
  }

  // Add row to the client table.
  function addContactRow(i, contact){
    // debugger;
    var tableId = 'contact-table'
    $("#"+ tableId).append("<tr id='contact-"+ contact.id + "'></tr>");
    $("#contact-"+contact.id).append("  <td data-id="+contact.id+">" + contact.name         + "</td>");
    $("#contact-"+contact.id).append("  <td>" + contact.address      + "</td>");
    $("#contact-"+contact.id).append("  <td>" + contact.phone_number + "</td>");
  }

  ///////////////////
  ///////////////
  // making a new contact
  $(".create-new-contact").on("click", createButtonClick);
  $("#submit").click( gettingValues );

  function gettingValues(event){
    event.preventDefault();
    var new_name = $("#name").val();
    var new_address = $("#address").val();
    var new_phone_number = $("#phone_number").val();

    var person = {
      name: new_name,
      phone_number: new_phone_number,
      address: new_address
    }

    $.ajax({
      url: "/contacts",
      method: "post",
      dataType: "json",
      success: changeStateTo,
      error: changeStateTo,
      data: person
    });
    changeStateTo('list')
  }

  ///////////////
  // opening a page to edit the specific data
  $ ("#contact-table").on("click","tr", function(e){
    var person_info = {
      id: e.target.dataset.id
    }
    // debugger
    $.ajax({
      url: "/contacts/" + person_info.id,
      method: "get",
      success: changeStateTo,
      error: changeStateTo
    })
    .then(function(data){
      changeStateTo('edit',data);

    })
  });

  function printdata(data){
    $("#editform").hide();
    // $("#single-contact").append("<p class='selectperson'>" + data.name + "</p>");
    // $("#single-contact").append("<p class='selectperson'>" + data.phone_number + "</p>");
    // $("#single-contact").append("<p class='selectperson'>" + data.address + "</p>");
    // $("#single-contact").append("<p class='selectperson'>" + data.created_at + "</p>");
    // debugger
    $("#single-contact").append('<form id="editform">');
    $("#single-contact form").append('<input type="text" id="name-edit" value='+ data.name +' /> <br>');
    $("#single-contact form").append('<input type="text" id="phone-edit" placeholder="description" value=' + data.phone_number + ' /> <br>');
    $("#single-contact form").append('<input type="text" id="address-edit" placeholder="tags" value=' + data.address + ' /> <br>');
    $("#single-contact form").append('<br><input type="submit" id="savebutton" value="Save" />');
    $("#single-contact form").append('<input type="submit" id="delete" value="Delete" />');

    $("#savebutton").on("click",function(e){
      e.preventDefault();
      // debugger;
      var new_name = $("#name-edit").val();
      var new_phone_number = $("#phone-edit").val();
      var new_address = $("#address-edit").val();

      var person = {
        name: new_name,
        phone_number: new_phone_number,
        address: new_address
      }

      $.ajax({
        url: "/contacts/" + data.id + "/edit",
        method: "post",
        dataType: "json",
        success: changeStateTo,
        error: changeStateTo,
        data: person
      });
      changeStateTo('list')
    })

    $("#delete").on("click",function(){
      $.ajax({
        url: "/contacts/" + data.id + "/delete",
        method: "post",
        dataType: "json",
        success: changeStateTo,
        error: changeStateTo
      });
      changeStateTo('list')
    })
  }




  // error: function(data){
  //   changeStateTo('list')
  // success: function(data){
  //   changeStateTo('edit')
  // },

  ////////////////
  // changing the state of pages

  function showContactClick(){
    changeStateTo('edit');
  }

  function createButtonClick(){
    changeStateTo('create');
  }

  function indexButtonClick(){
    // debugger;
    changeStateTo('list');
  }

  function editButtonClick(){
    changeStateTo('edit')
  }

  function hideAll(){
    // hide each div.
  }

}
