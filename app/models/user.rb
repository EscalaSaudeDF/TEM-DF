class User < ActiveRecord::Base
	# Attributes
	#user name or login
	def username= (username)
		@username = username
	end
	
	#user e-mail
	def email= (email)
		@email = email
	end

	#user password
	def password= (password)
		@password = password
	
	end	

=begin
	def documentation= (word)
		@documentation = word
	end
=end

	#user account status: false = blocked, true = active
	def account_status= (account_status)
		@account_status = account_status
	end

end

# Instantiates
user = User.new
