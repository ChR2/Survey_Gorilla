get '/' do
  erb :index
end

get '/login' do
  erb :login
end

get '/allsurveys' do
  erb :allsurveys
end

post '/login' do

  @user = User.authenticate(params[:user][:name],params[:user][:password])
  if @user
    session[:user_id] = @user.id
    redirect to("/")
  else
    @errors = "Username and Password didn't match"
    erb :login
  end
end
