
 post '/subscriptions/:id' do
   @user = current_user
   @subscription = Subscription.new(user_id: @user.id, channel_id: params[:id])
   if @subscription.save
     redirect "/users/#{@user.id}"
   else
     redirect "/channels/#{params[:id]}"
   end
 end

 delete '/subscriptions/:id' do
   @user = current_user
   @subscription = Subscription.find_by user_id: @user.id, channel_id: params[:id]
   @subscription.destroy
   redirect "/channels/#{params[:id]}"
 end





# # delete
# delete '/subscriptions/:id' do

#   #get params from url


#   @subscription = Subscription.find(params[:id]) #define subscription to delete

#   @subscription.destroy #delete subscription

#   redirect '/subscriptions' #redirect back to subscriptions index page

# end
