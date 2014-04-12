var optionNode = "<li><input class='option' type='text' name='survey[questions][][options][]' placeholder='an option'> <button tabindex = '-1' class='remove-button'>✖</button></li>";

var questionNode = "<li><input class='question' type='text' name='survey[questions][][question]' placeholder='What do you want to ask?'> <button tabindex = '-1' class='remove-button'>✖</button> <button tabindex = '-1' class='button add-option'>add option</button><ul>"+optionNode+"</ul></li>";


$(document).ready(function() {
    $("#check_email").hide();
    $("#check_password").hide();


  $("#sign_up").on("click", function(event){
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




  $('#survey-builder > ol').append(questionNode);
  $('#survey-builder').on('click', '.add-question', function(event){
    event.preventDefault();
    $($(this).siblings('ol')).append(questionNode);
  });

  $('#survey-builder').on('click', '.add-option', function(event){
    event.preventDefault();
    $($(this).siblings('ul')).append(optionNode);
  });

  $('#survey-builder').on('click', '.remove-button', function(event){
    event.preventDefault();
    $(this).parent().remove();
  });
});

