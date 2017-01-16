class Subscription < ActiveRecord::Base
  belongs_to :user
  belongs_to :channel
  # Remember to create a migration!
end
