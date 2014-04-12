


  first_user = User.create(name: "Jay Bobo", email: "j@dbc.com", password: "password1", password_confirmation: "password1")
  survey_one = Survey.create(name: "DBC Fun Survey", creator_id: first_user.id)

  question_one = Question.create(question: 'Are you having fun on the 7th floor?', survey_id: survey_one.id)

      choice_1 = Choice.create(choice: "Yes", question_id: question_one.id)
      choice_2 = Choice.create(choice: "No", question_id: question_one.id)
      choice_3 = Choice.create(choice: "Maybe", question_id: question_one.id)

  question_two = Question.create(question: 'Do you know Ryan Verhey?', survey_id: survey_one.id)

      choice_4 = Choice.create(choice: "Yes", question_id: question_two.id)
      choice_5 = Choice.create(choice: "No", question_id: question_two.id)
      choice_6 = Choice.create(choice: "Maybe", question_id: question_two.id)



  second_user = User.create(name: "Alan Haikal", email: "bigal@dbc.com", password: "password1", password_confirmation: "password1")
  survey_two = Survey.create(name: "DBC Amazing Fun Survey 2014", creator_id: second_user.id)

  question_three = Question.create(question: 'Do you have fun coding at all hours of the day?', survey_id: survey_two.id)

      choice_7 = Choice.create(choice: "Yes", question_id: question_three.id)
      choice_8 = Choice.create(choice: "No", question_id: question_three.id)
      choice_9 = Choice.create(choice: "Maybe", question_id: question_three.id)

  question_four = Question.create(question: 'Do you know Jarrod?', survey_id: survey_two.id)

      choice_10 = Choice.create(choice: "Yes", question_id: question_four.id)
      choice_11 = Choice.create(choice: "No", question_id: question_four.id)
      choice_12 = Choice.create(choice: "Maybe", question_id: question_four.id)


  round_one = Round.create(taker_id: first_user.id, survey_id: survey_one.id)
  round_two = Round.create(taker_id: second_user.id, survey_id: survey_two.id)

  round_three = Round.create(taker_id: first_user.id, survey_id: survey_two.id)
  round_four = Round.create(taker_id: second_user.id, survey_id: survey_one.id)

  response_one = Response.create(round_id: round_one.id, choice_id: choice_2.id)
  response_two = Response.create(round_id: round_one.id, choice_id: choice_6.id)
  response_three = Response.create(round_id: round_two.id, choice_id: choice_7.id)
  response_four = Response.create(round_id: round_two.id, choice_id: choice_11.id)

  response_five = Response.create(round_id: round_three.id, choice_id: choice_1.id)
  response_six = Response.create(round_id: round_three.id, choice_id: choice_5.id)
  response_seven = Response.create(round_id: round_four.id, choice_id: choice_6.id)
  response_eight = Response.create(round_id: round_four.id, choice_id: choice_10.id)





