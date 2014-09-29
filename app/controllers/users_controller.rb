require 'bcrypt'

class UsersController < ApplicationController
  	def index
      @users = User.all
  		render "index"
  	end

  	def create
  		@user = User.new(user_params)
      if @user.save
          if @user.password == @user.password_confirmation
  		        @user.password = BCrypt::Password.create(@user.password)
              upload params[:user][:document]
              @user.save
              TemdfMailer.welcome_email.deliver
              redirect_to(action: "index")
          else
            render "new" 
      end

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
      if @user.password != @user.password_confirmation
        #@user.document = params [:user][:document]
        render "edit"
      
      else
        @user = User.find(params[:id])
        params[:user][:password]= BCrypt::Password.create(params[:user][:password])
        @user.update (user_params)
        redirect_to(action: "index", id: @user)
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
          end
        end



end
