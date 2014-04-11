get '/' do
  # Look in app/views/index.erb
  erb :index
end

post '/new_user' do
  @user = User.create(name: params[:name], email: params[:email], password: params[:password], password_confirmation: params[:password_confirmation])
  session[:user_id] = @user.id
  erb :survey_options
end

post '/user' do
  @user = User.find_by_email(params[:email])

  if @user &&  @user.authenticate(params[:password])
    session[:user_id] = @user.id
    erb :survey_options
  else
    @error = "Wrong information, You fail at life!"
    erb :index
  end
end

# get '/survey_options' do
#   erb :survey_options
# end

get '/create_survey' do
  erb :create_survey
end
