require 'valid_email'
class User < ActiveRecord::Base


	attr_accessor :password_confirmation, :document

	validates :username, uniqueness: true, presence: true
	validates :email, uniqueness: true, presence: true, email: true
	validates :password, presence: true
	validates :password_confirmation, presence: true
	

	def self.autenticate (username, password)

		user = find_by_username_and_password( username, password )

		if user

			 # if user.account_status == true
			  	user
			 # else
			 # 	nil
		else
			nil
		end
	end

end
