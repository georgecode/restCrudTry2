
get '/sessions' do

  @sessions = Session.all #define instance variable for view

  erb :'sessions/index' #show all sessions view (index)

end


get '/sessions/new' do

  erb :'sessions/new' #show new sessions view

end



post '/sessions' do

  # @user = User.find(params[:session])
  @user = User.authenticate(params[:session][:email], params[:session][:password])
  # the following if statement is equal to 'if @user != nil'
  if @user
    login(@user)
    # @user_channels =User
    erb :'users/show'





  #   @user = User.find_by(email: params[:email])
  # p @user
  # p "XXXXXXXXXXXXXXX"
  # if @user && @user.authenticate(params[:email], params[:password])

  # # the following if statement is equal to 'if @user != nil'
  #   login(@user)
  #   erb :'users/show'
  else
    redirect '/sessions/new'
  end

  # #below works with properly formatted params in HTML form
  # @session = Session.new(params[:session]) #create new session

  # if @session.save #saves new session or returns false if unsuccessful
  #   redirect '/sessions' #redirect back to sessions index page
  # else
  #   erb :'sessions/new' # show new sessions view again(potentially displaying errors)
  # end

end



get '/sessions/:id' do

  #gets params from url

  @session = Session.find(params[:id]) #define instance variable for view

  erb :'sessions/show' #show single session view

end



get '/sessions/:id/edit' do

  #get params from url
  @session = Session.find(params[:id]) #define intstance variable for view

  erb :'sessions/edit' #show edit session view

end



put '/sessions/:id' do

  #get params from url
  @session = Session.find(params[:id]) #define variable to edit

  @session.assign_attributes(params[:session]) #assign new attributes

  if @session.save #saves new session or returns false if unsuccessful
    redirect '/sessions' #redirect back to sessions index page
  else
    erb :'sessions/edit' #show edit session view again(potentially displaying errors)
  end

end



delete '/sessions/:id' do

  #get params from url
  @session = Session.find(params[:id]) #define session to delete

  @session.destroy #delete session

  redirect '/sessions' #redirect back to sessions index page

end

