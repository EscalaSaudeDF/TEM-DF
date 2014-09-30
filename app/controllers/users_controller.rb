require 'bcrypt'

class UsersController < ApplicationController
    def index
        @users = User.all
  	end

  	def create
  		@user = User.new(user_params)
        if @user.password == @user.password_confirmation
            @user.save
            upload params[:user][:document]
            
            redirect_to root_path
        else
            render "new"
        end
  	end

    def show
        @user = User.find(params[:id])
    end

  	def new
  		@user = User.new
  	end

    def edit
        @user = User.find(params[:id])
    end

    def update
        @user = User.new(user_params)
        if @user.password == @user.password_confirmation
            @user = User.find(params[:id])
            @user.update (user_params)

            redirect_to root_path
        else
            render "edit"
        end
    end

    private
        def user_params
            params.require(:user).permit(:username, :email, :password, :password_confirmation, :account_status)
        end

        def upload(uploaded_io)
            if uploaded_io
                File.open(Rails.root.join('public', 'uploads', 'arquivo_medico'), 'wb') do |file| 
                    file.write(uploaded_io.read)
                end
                # send file to temdf email
                TemdfMailer.welcome_email.deliver
            end
        end
end
