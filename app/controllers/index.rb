get '/' do
  erb :index
end

get '/login' do
  erb :login
end

get '/create_user' do
  erb :create_user
end

get '/allsurveys' do
  @all_surveys = Survey.all
  erb :allsurveys
end

get '/take_survey/:survey_id' do
  
end

get '/logout' do
  session.clear
  redirect '/'
end



post '/login' do
  @user = User.find_by_username(params[:user][:username])

  if @user && @user.authenticate(params[:user][:password])
    session[:user_id] = @user.id
    redirect to '/allsurveys'
  else
    @error = "Whatchu talkin bout, Willis?"
    erb :login
  end
end

post '/create_user' do  
  @user = User.new(params[:user])

  if @user.save
    session[:user_id] = @user.id
    redirect to '/allsurveys'
  else
    @error = "You messed up, sucka!"
    erb :create_user
  end
end

post '/take_survey/:survey_id' do
end
