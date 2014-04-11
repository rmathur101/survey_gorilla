$(document).ready(function() {
    $("#check_email").hide();
    $("#check_password").hide();


  $("#sign_up").on("click", function(event){
      event.preventDefault();

    $("#check_email").hide();
    $("#check_password").hide();


      var email = $("#email").val();
      var password = $("#password").val();

      // console.log(email);
      // console.log(password);

      var val_email = function(str) {
          return str.match(/\b[A-z0-9._%+-]+@[A-z0-9.-]+\.[A-z]{2,4}\b/) === null;
      }
      var val_password_charlength = function(str) {
          return str.match(/\b.{8,}\b/) === null;
      }
      var val_password_capital = function(str) {
          return str.match(/[A-Z]+/) === null;
      }
      var val_password_number = function(str) {
          return str.match(/[0-9]+/) === null;
      };

      if (val_email(email)){
        $("#check_email").show();
      };

      if (val_password_charlength(password)){
        $("#check_password").show();
      };

      if (val_password_capital(password)){
        $("#check_password").show();
      };

      if (val_password_number(password)){
        $("#check_password").show();
      };



  });

  var question_counter = 2
  $("#question_add").on("click", function(event){
    (event).preventDefault();
    var option_counter = 1
    $('#append_question').append("<div class='question_content'>Question " + question_counter +": <input name='survey_question_"+question_counter+"' type='text'><br>Option "+option_counter+" <input name='survey_quest_"+question_counter+"_resp"+question_counter+"' type='text'><br><br><button id='option_add_"+option_counter+"'>Add an option</button><button id='option_remove_"+option_counter+"'>Remove an option</button><br><br></div>");
    question_counter += 1;
  });

   $("#question_remove").on("click", function(event){
    (event).preventDefault();
      $("#append_question div:last-child").remove();
      question_counter -= 1;
   });

   $(".option_add_"+option_counter+"").on("click", function(event) {
    (event).preventDefault();
        $("#append_question").append();
    option_counter += 1
   });

   $(".option_remove_"+option_counter+"").on('click', function(event) {
    (event).preventDefault();

    option_counter -= 1
   });

});


