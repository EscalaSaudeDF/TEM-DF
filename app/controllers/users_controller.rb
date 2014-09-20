class UsersController < ApplicationController
  	def index
  		render "index"
  	end

  	#new common user
  	def new
  		@user = User.new
  	end

end
