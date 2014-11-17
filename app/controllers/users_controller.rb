require 'bcrypt'

class UsersController < ApplicationController
    def index
        @user = User.find_by_id(session[:remember_token])

      if @user && @user.username == "admin" 
        @users = User.all
      else
        redirect_to root_path
      end

  	end

  	def create
  		@user = User.new(user_params)
        if @user.account_status == false && !params[:user][:document]
            flash.now.alert = "Você precisa anexar um documento!"
            render "new"
        elsif  @user.password == @user.password_confirmation
            random = Random.new
            @user.account_status = false
            if @user.save
                upload params[:user][:document]
                @user.update_attribute(:token_email, random.seed)

                TemdfMailer.confimation_email(@user.id, @user.token_email, @user.email).deliver

                redirect_to root_path, notice: "Por favor confirme seu cadastro pela mensagem enviada ao seu email!"
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
          if @user.username == "admin" #admin's update
            email = params[:user][:email]

            user_from_email = User.find_by_email(email)

            if user_from_email && @user != user_from_email
                flash[:warning] = "Email já existente"
                render "edit" 
            else 
                @user.update_attribute(:email , email)
                redirect_to root_path, notice: 'Usuário alterado!'
            end

          else #commom user's update 
            username = params[:user][:username]
            email = params[:user][:email]

            user_from_username = User.find_by_username(username)
            user_from_email = User.find_by_email(email)

            if user_from_username && @user != user_from_username
                flash[:warning] = "Nome já existente"
                render "edit"
            elsif user_from_email && @user != user_from_email
                flash[:warning] = "Email já existente"
                render "edit" 
            else 
                @user.update_attribute(:username , username)
                @user.update_attribute(:email , email)
                redirect_to root_path, notice: 'Usuário alterado!'
            end
          end
        else
            redirect_to root_path
        end
    end

    def update_password
      @user_session = User.find_by_id(session[:remember_token])
      
        if @user_session
            @user = User.authenticate(@user_session.username, params[:user][:password])
            new_password = params[:user][:new_password]
            
            if params[:user][:password_confirmation] == new_password && !new_password.blank?
              @user.update_attribute(:password, new_password)
              redirect_to root_path, notice: 'Alteração feita com sucesso'
            else
              redirect_to edit_password_path, notice: 'Confirmação nao confere ou campo vazio'
            end
        else
          redirect_to edit_password_path
        end
    end
    
    def desactivate
        @user = User.find_by_id(session[:remember_token])

        if @user && @user.username != "admin"
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

    def confirmation_email

        @user = User.find_by_id_and_token_email(params[:id],params[:token_email])
        msg = ''

        if @user && @user.token_email
           @user.update_attribute(:account_status, true)
           @user.update_attribute(:token_email, nil)
           msg = "Cadastro Confirmado!"
        else
          msg = "Link inválido!"
        end
        redirect_to root_path, notice: msg
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
