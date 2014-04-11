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