get "/surveys/show/:id" do
  @survey = Survey.find(params[:id])
  erb :"surveys/show"
end

get '/surveys/take/:id' do
  @survey = Survey.find(params[:id])
  erb :"surveys/take_survey"
end

post '/push_survey_data' do
  Survey.create!()
  erb :"surveys/show"
end
