#CREATE NEW COMMENT
get '/comments/:id/new' do
	@property = Property.find(params[:id])
	erb :"comment/newcomment"
end

post '/comments/:id' do
	comment = Comment.create(comment: params[:comment])	
	property = Property.find(params[:id])
	redirect "/properties/#{property.id}"
end

