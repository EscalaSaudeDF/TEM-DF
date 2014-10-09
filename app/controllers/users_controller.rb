require 'bcrypt'

class UsersController < ApplicationController
    def index
        @users = User.all
  	end

  	def create
  		@user = User.new(user_params)
        if @user.password == @user.password_confirmation
            if @user.save
                upload params[:user][:document]
                redirect_to root_path
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

    def edit
        @user = User.find_by_id(session[:remember_token])
    end

    def edit_password
        @user = User.find_by_id(session[:remember_token]) 
    end

    def update
      @user = User.find_by_id(session[:remember_token])

        if @user
            if User.find_by_username(params[:user][:username]) && @user != User.find_by_username(params[:user][:username])
                flash[:warning] = "Nome ja existente"
                render "edit"
            elsif User.find_by_email(params[:user][:email]) && @user != User.find_by_email(params[:user][:email])
                flash[:warning] = "Email ja existente"
                render "edit" 
            else 
                @user.update_attribute(:username , params[:user][:username])
                @user.update_attribute(:email , params[:user][:email])
                redirect_to root_path, notice: 'Usuario alterado!'
            end
        else
            redirect_to root_path
        end
    end

    def update_password
      @userSession = User.find_by_id(session[:remember_token])
      
        if @userSession
            @user = User.authenticate(@userSession.username, params[:user][:password])
            if params[:user][:password_confirmation] == params[:user][:new_password] && !params[:user][:new_password].blank?
              @user.update_attribute(:password, params[:user][:new_password])
              redirect_to root_path, notice: 'Alteracao feita com sucesso'
            else
              redirect_to edit_password_path, notice: 'Confirmacao nao confere ou campo vazio'
            end
        else
          redirect_to edit_password_path
        end
    end
    
    def desactivate
        @user = User.find_by_id(session[:remember_token])

         if @user
            @user.update_attribute(:account_status, false)
            redirect_to logout_path
        else
          @user = User.find_by_id(params[:id])

          if @user
            @user.update_attribute(:account_status, false)
            redirect_to(action: "index")    
          else
            redirect_to root_path
          end
        end
    end

     def reactivate
      @user = User.find_by_id(params[:id])
      if @user
        @user.update_attribute(:account_status, true)
        redirect_to(action: "index")
      else
        redirect_to root_path
      end
    end

    def destroy
         @user = User.find(params[:id])
         @user.destroy
         redirect_to(action: "index")
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
                TemdfMailer.request_account.deliver
            end
        end
end
