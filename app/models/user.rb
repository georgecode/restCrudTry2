class User < ActiveRecord::Base
  # Remember to create a migration!
  # has_many :Subscriptions
  # has_many :channels

  def password
    @password ||= BCrypt::Password.new(hashed_password)
  end

  def password=(new_password)
    @password = BCrypt::Password.create(new_password)
    self.hashed_password = @password
  end
end#End User

#$cd Desktop/devbootcamp/onSite/week4/assesmentTry2/crud-and-rest-checkpoint-challenge/

# user = User.new(:first_name=>'George',:last_name=>'Czu',:email=>'george@email.com', :password => 'password')

# user = User.new(:first_name=>'Dana',:last_name=>'Donel',:email=>'dana@email.com', :password => 'password')