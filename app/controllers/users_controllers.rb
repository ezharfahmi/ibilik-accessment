# LOGIN
post '/users/login' do
	user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
	  session[:user_id] = user.id 
	  redirect "/users/#{user.id}"
	else 
		erb :'user/login'
	end
end

#LOGOUT
get '/users/logout' do
	session[:user_id] = nil
	redirect '/users'
end

#SIGN UP PAGE
get '/users/new' do
	erb :"user/register"
end

#CREATE NEW USER
post '/users' do
	user = User.create(name: params[:name], email: params[:email], password: params[:password])
	redirect "/users"
end

#VIEW PROFILE PAGE
get '/users/:id' do
	@user = User.find(params[:id])
	erb :'user/profile'
end


#LOGIN PAGE
get '/users' do
	erb :'user/login'
end



