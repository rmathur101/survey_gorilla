get "/surveys/show/:id" do
  @survey = Survey.find(params[:id])
  erb :"surveys/show"
end

get '/surveys/take/:id' do
  @survey = Survey.find(params[:id])
  erb :"surveys/take_survey"
end

post '/push_survey_data' do
  # assume session[:user_id] gives you the user_id
  # user_id = session[:user_id]
  @user = User.find(1)
  user_id = User.first.id;

  # Round.create!() The only thing being passed in is survey_id and user_id
  # Response.create!() Pass in Round.id (from last round (created above)) and Choice.id
  puts "HERE ARE THE PARAMS"
  p params
    Round.create!(taker_id: user_id, survey_id: params["survey_id"])
  params.each do |question_id|
    p question_id
    unless question_id[0] == "survey_id"
      Response.create!(round_id: Round.last.id, choice_id: params[question_id])
    end
  end

  erb :"users/dashboard"
end

post '/surveys/new' do
  create_new_survey(params)
  redirect to "/users/dashboard"
end
