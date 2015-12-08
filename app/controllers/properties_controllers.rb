#DISPLAY CREATE NEW PROPERTIES
get '/properties/new' do
	erb :'property/new'	
end

#CREATE NEW PROPERTIES
post '/properties' do
	property = Property.create(location: params[:location], user_id: session[:user_id], title: params[:title], description: params[:description], rental: params[:rental])
	redirect "/myproperties/#{property.id}"
end

#DISPLAY UPDATE PROPERTIES
get '/properties/:id/edit' do
	@property = Property.find(params[:id])
	erb :'property/update'
end 

#UPDATE PROPERTIES

patch '/myproperties/:id' do
	property = Property.find(params[:id])
	property.update(location: params[:location], user_id: session[:user_id], title: params[:title], description: params[:description], rental: params[:rental])
	redirect "/myproperties/#{property.id}"
end

#DELETE PROPERTY
delete '/properties/:id' do
	property = Property.find(params[:id])
	user = User.find(session[:user_id])
	property.destroy
	redirect "properties"
end

#SHOW THE PROPERTY
get '/properties/:id' do
	@property = Property.find(params[:id])
	@user = User.find(session[:user_id])
	erb :'property/view'
end

#SHOW MY PROPERTY
get '/myproperties/:id' do
	@property = Property.find(params[:id])
	@user = User.find(session[:user_id])
	erb :'property/myview'
end

#SHOW CURRENT USER PROPERTY
get '/properties' do
	@user = User.find(session[:user_id])
	@property = Property.where(user_id: @user.id)
	erb :'property/myproperty'
end

#SHOW ALL PROPERTY
get '/allproperties' do
	@property = Property.all
	@user = User.find(session[:user_id])

	erb :'property/allproperty'
end



