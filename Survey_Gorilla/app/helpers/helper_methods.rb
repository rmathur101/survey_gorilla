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
  (total_responses_by_choice(choice_id) / total_responses_by_question(question_id)) * 100
end
