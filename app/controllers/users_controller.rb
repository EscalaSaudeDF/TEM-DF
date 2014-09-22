class UsersController < ApplicationController
  	def index
  		render "index"
  	end

  	#save common user
  	def create
  		@user = User.new(user_params)
  		@user.save
  		redirect_to(action: "index", id: @user)
  	end

  	#new common user
  	def new
  		@user = User.new
  	end

  	def login
        
  	end

    private
      def user_params
          params.require(:user).permit(:username, :email, :password)
      end
end
