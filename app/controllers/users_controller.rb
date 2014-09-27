require 'bcrypt'

class UsersController < ApplicationController
  	def index
  		render "index"
  	end

  	def create
  		@user = User.new(user_params)
        puts params[:user]
        #@user.account_status = true
        if @user.save
            if @user.password == @user.password_confirmation
  		          @user.password = BCrypt::Password.create(@user.password)
                @user.document = params [:user][:document]
                @user.save
                redirect_to(action: "index", id: @user)
            else
                render "new" 
            end

        else
            render "new"
        end
  	end

  	def new
  		@user = User.new
  	end

    private
        def user_params
            params.require(:user).permit(:username, :email, :password, :password_confirmation, :account_status)
        end

end
