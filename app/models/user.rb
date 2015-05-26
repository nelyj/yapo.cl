class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and 
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, omniauth_providers: [:facebook]


 	def self.find_for_facebook(auth, signed_in_resource=nil)
 		
 		user = User.where(provider: auth.provider, uid: auth.uid).first
 		
 		return user if user

 		user = User.where(email: auth.info.email).first
 		return user if user
 
 		User.create(
 			name: auth.extra.raw_info.name,
 			provider: auth.provider, uid: auth.uid,
 			email: auth.info.email,
 			password: Devise.friendly_token[0,40]
 		)

 	end

end
