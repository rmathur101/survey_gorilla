def logged_in?
  session[:user_id] ? true : false
end

def total_responses_by_question(question_id)
  q = Question.find(question_id)
  q.responses.count
end

def total_responses_by_choice(choice_id)
  c = Choice.find(choice_id)
  c.responses.count
end

def percentage_of_responses(question_id, choice_id)
  if total_responses_by_question(question_id) != 0
    ((total_responses_by_choice(choice_id).to_f / total_responses_by_question(question_id).to_f) * 100).floor
  else
    return 0
  end
end

#NOTES
#what is happening when we delete a survey? is all the corresponding information for that survey being deleted? --> No. Even though we are deleting the survey from the surveys table, the survey id persists in the round table and the choices table and the responses table and the questions table.
#do we want the above information to persist? --> yes but because we are taking away the survey the target from surveys table - we are losing the name of the survey. so when we try to find which surveys a user has taken we are not able to find the name; we can accomplish this problem by making sure that we delete the survey id from the rounds table. (but then we lose the ability to access the survey data from a deleted survey)
#what if we delete the survey id from round instead of surveys? that way we can still access the survey name but we are going to try to stop the user from starting a round with that survey? --> that won't work because when we displaying the surveys we are still using the Survey.all 

#-----------------

#the login/register screen allows a new user to register with an already reigstered password (but does not allow user to interact once logged in)

#-------------------------
#check validation


#find_user_taken_surveys not working correctly - because the deletion of survey is not working correctly

def find_user_taken_surveys(user)
  rounds = user.rounds
  survey_name_arr = []
  survey_arr = []
  rounds.each do |round|
    if !survey_name_arr.include?(round.survey.name)
      survey_name_arr << round.survey.name
    end
  end
  survey_name_arr.each do |name|
    survey = Survey.find_by(name: name)
    survey_arr << survey
  end
  return survey_arr
end

def create_new_survey(params)
  title = params[:survey][:title]
  new_survey = Survey.create(name: title, creator_id: session[:user_id])
  # puts new_survey.name
  questions = params[:survey][:questions]
  questions.each do |question|
    new_question = new_survey.questions.create(question: question[:question])
    question[:options].each do |choice|
      new_question.choices.create(choice: choice)
    end
  end
end
