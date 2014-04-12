get '/' do
  # Look in app/views/index.erb
  erb :index
end


# get '/survey_options' do
#   erb :survey_options
# end

get '/create_survey' do
  erb :create_survey
end
