class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  validates_uniqueness_of :email, :username

 def self.from_omniauth(access_token)
     data = access_token.info
     user = User.where(:email => data["email"]).first
     unless user
          user = User.create(username: data["name"],
             email: data["email"],
             password: Devise.friendly_token[0,20]
          )
     end
    user
 end
end
