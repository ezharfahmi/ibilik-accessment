get '/bookings/new' do
	@property = Property.find(params[:id])
	erb :'booking/new'
end

post '/bookings' do
	@property = Property.find(params[:id])
	owner = @property.user
	@booking = Booking.create(user_id: session[:user_id], property_id: @property.id)
	erb :"booking/showbook"
end


# get '/bookings/:id' do
# 	@booking = Booking.find(params[:id])
# 	erb :'booking/showbook'
# end