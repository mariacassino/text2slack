class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable,
         :omniauth_providers => [:slack]

         has_many :messages



         def self.from_omniauth(auth)
             where(slack_id: auth.uid).first_or_create do |user|
               user.slack_id = auth.uid
               user.email = auth.info.email
               user.password = Devise.friendly_token[0,20]
               user.slack_token = auth.credentials.token
             end
         end


end
