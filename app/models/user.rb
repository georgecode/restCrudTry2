class User < ActiveRecord::Base
  # Remember to create a migration!
   has_many :subscriptions
   has_many :channels, through: :subscriptions

   validates :email, :hashed_password, presence: true
   validates :email, uniqueness: true

  def password
    @password ||= BCrypt::Password.new(hashed_password)
  end

  def password=(new_password)
    @password = BCrypt::Password.create(new_password)
    self.hashed_password = @password
  end

  def self.authenticate(email, password)
    @user = User.find_by(email: email)
    return nil if @user.nil?
    if @user.password == password
      @user
    else
      nil
    end
  end

end#End User

#$cd Desktop/devbootcamp/onSite/week4/assesmentTry2/crud-and-rest-checkpoint-challenge/

# user = User.new(:first_name=>'George',:last_name=>'Czu',:email=>'george@email.com', :password => 'password')

# user = User.new(:first_name=>'Dana',:last_name=>'Donel',:email=>'dana@email.com', :password => 'password')