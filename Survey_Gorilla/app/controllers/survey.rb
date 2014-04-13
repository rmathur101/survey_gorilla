get "/surveys/show/:id" do
  @survey = Survey.find(params[:id])
  erb :"surveys/show"
end

post "/surveys/take" do
  redirect to "/surveys/take/#{params[:survey_id]}"
end

get '/surveys/take/:id' do
  # @survey = Survey.find(params[:id])
  @survey = Survey.where(id: params[:id]).first
  p @survey
  if @survey == nil
    @survey = false
    redirect to "/users/dashboard?error=error"
  end
  erb :"surveys/take_survey"
end

post '/push_survey_data' do
  # assume session[:user_id] gives you the user_id
  # user_id = session[:user_id]
  @user = User.find(session[:user_id])
  user_id = session[:user_id]

  # Round.create!() The only thing being passed in is survey_id and user_id
  # Response.create!() Pass in Round.id (from last round (created above)) and Choice.id
  puts "HERE ARE THE PARAMS"
  # p params
    Round.create!(taker_id: user_id, survey_id: params["survey_id"])
  params.each do |question_id, choice_id|
    # p question_id
    # p choice_id
    unless question_id == "survey_id"
      # p params[choice_id]
      Response.create!(round_id: Round.last.id, choice_id: choice_id.to_i)
      p Response.last
    end
  end

  erb :"users/dashboard"
end

post '/surveys/new' do
  create_new_survey(params)
  redirect to "/users/dashboard"
end
