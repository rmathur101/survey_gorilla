$(function(){
  $(".delete_survey_button").click(function(event) {
    event.preventDefault();
    var surveyID = $(this).val();
    var listItem = $(this).parent();
    $.post("/surveys/delete", {id: surveyID}, function(data) {
      $(listItem).text("This survey has been deleted.").delay(2000).slideUp(400);
      // $(listItem).remove();
    })
  });

});
