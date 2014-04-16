$(document).ready(function() {
    $("#check_email").hide();
    $("#check_password").hide();


  $("#sign_up").on("click", function(event){
      // event.preventDefault();

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
        event.preventDefault();
        $("#check_email").show();

      };

      if (val_password_charlength(password)){
        event.preventDefault();
        $("#check_password").show();
      };

      if (val_password_capital(password)){
        event.preventDefault();
        $("#check_password").show();
      };

      if (val_password_number(password)){
        event.preventDefault();
        $("#check_password").show();
      };
  });


//so we want to do the following actions using objects instead. how do we accomplish this? we can create a question object. what attributes will a question object have?


  function Question(question_counter){
    this.question_options = [];
    this.question_options_counter = 1;
    this.question_html = "<div class='question_content'>Question " + question_counter +": <input name='survey_question_"+question_counter+"' type='text'><br>Option "+ this.question_options_counter+" <input name='survey_quest_"+question_counter+"_resp"+question_counter+"' type='text'><br><br><button id='option_add_"+this.question_options_counter+"'>Add an option</button><button id='option_remove_"+this.question_options_counter+"'>Remove an option</button><br><br></div>";
  }; //what we pass into the questoin will determine how we distinguish questions (maybe we should be passing in an index)

  function Option(position) {
    this.position = position;
  };
  //what is the position? is this indicating what option it is? maybe this should not be determined by how we pass something into the function. there must be a more viable way to do it.

  // Question.prototype.add_option(option_object) {this.question_options.push(option_object)};
  // Question.prototype.increment_counter{this.question_options_counter = this.option_counter + 1};

//--------------------------------------------------------defining function

 var question_counter = 2;
  $("#question_add").on("click", function(event){
    (event).preventDefault();

    new_question = new Question(question_counter);
    console.log(new_question.question_html);

    // var option_counter = 1
    $('#append_question').append(new_question.question_html);
    question_counter += 1;
  });

   // $("#question_remove").on("click", function(event){
   //  (event).preventDefault();
   //    $("#append_question div:last-child").remove();
   //    question_counter -= 1;
   // });

   // $(".option_add_"+option_counter+"").on("click", function(event) {
   //  (event).preventDefault();
   //      $("#append_question").append();
   //  option_counter += 1
   // });

   // $(".option_remove_"+option_counter+"").on('click', function(event) {
   //  (event).preventDefault();

   //  option_counter -= 1
   // });

});


//   var question_counter = 2
//   $("#question_add").on("click", function(event){
//     (event).preventDefault();
//     var option_counter = 1
//     $('#append_question').append("<div class='question_content'>Question " + question_counter +": <input name='survey_question_"+question_counter+"' type='text'><br>Option "+option_counter+" <input name='survey_quest_"+question_counter+"_resp"+question_counter+"' type='text'><br><br><button id='option_add_"+option_counter+"'>Add an option</button><button id='option_remove_"+option_counter+"'>Remove an option</button><br><br></div>");
//     question_counter += 1;
//   });

//    $("#question_remove").on("click", function(event){
//     (event).preventDefault();
//       $("#append_question div:last-child").remove();
//       question_counter -= 1;
//    });

//    $(".option_add_"+option_counter+"").on("click", function(event) {
//     (event).preventDefault();
//         $("#append_question").append();
//     option_counter += 1
//    });

//    $(".option_remove_"+option_counter+"").on('click', function(event) {
//     (event).preventDefault();

//     option_counter -= 1
//    });

// });


