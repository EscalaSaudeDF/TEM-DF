class User < ActiveRecord::Base

	attr_reader :account_status

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
