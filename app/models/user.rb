class User < ActiveRecord::Base
	# Attributes
	def username= (word)
		@username = word
	end
	
	def email= (word)
		@email = word
	end

	def password= (word)
		@password = word
	
	end	

	def documentation= (word)
		@documentation = word
	end

	def account_status= (word)
		@account_status = word
	end

end

# Instantiates
user = User.new
