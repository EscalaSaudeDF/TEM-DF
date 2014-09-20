class UsersController < ApplicationController
  	def index
  		render "index"
  	end

  	#save common user
  	def create
  		@user = User.new params[:username]
  		@user.save
  		redirect_to(action: "index", id: @user)
  	end

  	#new common user
  	def new
  		@user = User.new
  	end

  	def login
        
  	end

end
