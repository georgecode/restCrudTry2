class Channel < ActiveRecord::Base
  has_many :subscriptions


  # This is how you get channel.fuckers to return a list
  #of user instances
  has_many :fuckers, through: :subscriptions, source: :user


end

# xchannel= Channel.all.first
# xchannel.fuckers

#the above commands will return a list of users
