##I CUT AND PASTEDed this shit from another assignment

helpers do
  def login(user)
    session[:user_id] = user.id
  end

  def logout
    session.clear
  end

  def current_user
    if session[:user_id]
      User.find(session[:user_id])
    else
      nil
    end
  end


def subscribed
   @user = current_user
   @subscription = Subscription.find_by user_id: @user.id, channel_id: @channel.id
 end
end#END helpers do