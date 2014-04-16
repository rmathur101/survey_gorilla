
post '/new_user' do
  @user = User.new(name: params[:name], email: params[:email], password: params[:password], password_confirmation: params[:password_confirmation])
  if @user.save
    session[:user_id] = @user.id
    redirect to "/users/dashboard"
  else
    # @error = "something wrong"
    redirect to "/?signin_error=something-wrong"
    # erb :index
  end
end

post '/user' do
  @user = User.find_by_email(params[:email])

  if @user &&  @user.authenticate(params[:password])
    session[:user_id] = @user.id
    redirect to "/users/dashboard"
  else
    @error = "Wrong information, You fail at life!"
    erb :index
  end
end

get '/users/dashboard' do
  if logged_in?
    @user = User.find(session[:user_id])

    @error = params[:error]

    erb :"users/dashboard"
  else
    redirect to "/"
  end
end

get '/logout' do
  session.clear
  redirect to "/"
end
