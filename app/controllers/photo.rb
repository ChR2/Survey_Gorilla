get '/pictures' do
  @pictures = Photo.all
  erb :allpictures
end

get '/albums/:album_id/:photo_id' do
	@picture = Album.find(params[:album_id]).photos.find(params[:photo_id])
	erb :photo
end



