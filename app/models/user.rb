class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, :omniauth_providers => [:github]
  has_many :rvs, through: :trips
  has_many :trips
  

  def self.from_omniauth(auth)
    if !auth.token
      where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
        user.provider = auth.provider
        user.uid = auth.uid
        user.email = auth.info.email
        user.password = Devise.friendly_token[0,20]
      end
    else 
      where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
        user.token = auth.token
        user.expires = auth.expires
        user.expires_at = auth.expires_at
        user.refresh_token = auth.refresh_token
      end
    end
  end
  
end
