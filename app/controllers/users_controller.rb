require 'bcrypt'

class UsersController < ApplicationController
  	def index
  		render "index"
  	end

  	def create
  		@user = User.new(user_params)
        @user.account_status = true
        if @user.password == @user.password_confirmation
  		    @user.password = BCrypt::Password.create(@user.password)
          @user.save
            redirect_to(action: "index", id: @user)
        else
            render "new" 
        end
  	end

    def create_medic_user
      @user = User.new(user_params)
      @user.account_status = false
      @user.save
      redirect_to(action: "index", id: @user)
    end

  	def new
  		@user = User.new
  	end

  	def login
        
  	end

    private
      def user_params
          params.require(:user).permit(:username, :email, :password, :password_confirmation)
      end
end
