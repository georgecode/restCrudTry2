get '/users' do
  @users = User.all #define instance variable for view
  erb :'users/index' #show all users view (index)
end


get '/users/new' do
  erb :'users/new' #show new users view
end

post '/users' do
  @user = User.new(params[:user])
  p @user.first_name
  # p "first_name: #{@user.first_name}\n last_name: #{@user.last_name}"
  # @user = User.new(params[:user])
  if @user.save
    login(@user)
    redirect "users/#{@user.id}"
  else
    redirect '/'
  end
end


get '/users/:id' do

  #gets params from url

  @user = User.find(params[:id]) #define instance variable for view

  erb :'users/show' #show single user view

end


#if you need a edit it goes here
# get '/users/:id/edit' do

#   #your code here

# end


# put '/users/:id' do

#   #get params from url
#   @user = User.find(params[:id]) #define variable to edit

#   @user.assign_attributes(params[:user]) #assign new attributes

#   if @user.save #saves new user or returns false if unsuccessful
#     redirect '/users' #redirect back to users index page
#   else
#     erb :'users/edit' #show edit user view again(potentially displaying errors)
#   end

# end

