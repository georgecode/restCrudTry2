
get '/channels' do

  @channels = Channel.all #define instance variable for view

  erb :'channels/index' #show all channels view (index)

end



get '/channels/new' do

  erb :'channels/new' #show new channels view

end



post '/channels' do

  #below works with properly formatted params in HTML form
  @channel = Channel.new(params[:channel]) #create new channel

  if @channel.save #saves new channel or returns false if unsuccessful
    redirect '/channels' #redirect back to channels index page
  else
    erb :'channels/new' # show new channels view again(potentially displaying errors)
  end

end




get '/channels/:id' do

  #gets params from url

  @channel = Channel.find(params[:id]) #define instance variable for view
  @subscribers_count =@channel.fuckers.length

  erb :'channels/show' #show single channel view

end





get '/channels/:id/edit' do

  #get params from url
  @channel = Channel.find(params[:id]) #define intstance variable for view

  erb :'channels/edit' #show edit channel view

end



put '/channels/:id' do

  #get params from url
  @channel = Channel.find(params[:id]) #define variable to edit

  @channel.assign_attributes(params[:channel]) #assign new attributes

  if @channel.save #saves new channel or returns false if unsuccessful
    redirect '/channels' #redirect back to channels index page
  else
    erb :'channels/edit' #show edit channel view again(potentially displaying errors)
  end

end




put '/channels/:id' do

  #get params from url
  @channel = Channel.find(params[:id]) #define variable to edit

  @channel.assign_attributes(params[:channel]) #assign new attributes

  if @channel.save #saves new channel or returns false if unsuccessful
    redirect '/channels' #redirect back to channels index page
  else
    erb :'channels/edit' #show edit channel view again(potentially displaying errors)
  end

end

#DELETE
post '/channels/:id' do

  #get params from url
  @channel = Channel.find(params[:id]) #define channel to delete

  # @channel.destroy #delete channel

  redirect '/channels' #redirect back to channels index page

end
