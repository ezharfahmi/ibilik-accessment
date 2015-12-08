#CREATE NEW COMMENT
post '/comments' do
	comment = Comment.create(comment: params[:comment], user_id: session[:user_id], property_id: params[:property_id])	
	property = Property.find(params[:property_id])
	redirect "/properties/#{property.id}"
end


#DISPLAY UPDATE PROPERTIES
get '/comments/:id/edit' do
	@comment = Comment.find(params[:id])
	erb :'comment/updatecomment'
end 

#UPDATE PROPERTIES

patch '/comments/:id' do
	comment = Comment.find(params[:id])
	comment.update(comment: params[:comment])
	property = comment.property
	redirect "/properties/#{property.id}"
end

#DELETE PROPERTY
delete '/comments/:id' do
	comment = Comment.find(params[:id])
	comment.destroy
	property = comment.property
	redirect "/properties/#{property.id}"
end