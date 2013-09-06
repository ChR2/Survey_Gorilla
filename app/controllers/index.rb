#GET ++++++++++++++++++++++++++++++++

get '/' do
  # Look in app/views/index.erb
  erb :index
end

get '/login' do
	erb :login
end

get '/createuser' do
	erb :createuser
end

get '/logout' do
  session.clear
  erb :index
end

get '/user/profile' do
  @albums = current_user.albums
  erb :profile
end

#POST +++++++++++++++++++++++++++++++

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

post '/createuser' do
	p params
	@user = User.create(params[:user])
	@user.albums << Album.create(name: "Default")
  redirect to '/'
end

