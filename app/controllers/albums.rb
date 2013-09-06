get '/albums' do
  # Look in app/views/index.erb
  @albums = Album.all
  erb :allalbums
end

get '/albums/:id' do
  @album= Album.find(params[:id])
  @pictures = @album.photos
  erb :allpictures
end

post '/createalbum' do
	current_user.albums << Album.create(params[:album])
	@albums = current_user.albums
	erb :profile
end

post '/albums/:id' do
		p params
		puts "============================================================"
    photo = current_user.albums.find(params[:id]).photos.new()
    photo.file = params[:image]
    photo.save
    @albums = current_user.albums
    erb :profile
end