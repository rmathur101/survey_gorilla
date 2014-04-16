get '/' do
  # Look in app/views/index.erb
  if logged_in?
    redirect to "/users/dashboard"
  elsif params[:signin_error]
    	@signin_error = "Something went wrong. try again"
    	erb :index
  else
    erb :index
  end
end


# get '/survey_options' do
#   erb :survey_options
# end

get '/create_survey' do
  erb :create_survey
end

post "/surveys/delete" do
  survey = Survey.find(params[:id])
  survey.destroy
end

