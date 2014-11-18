class PasswordResetsController < ApplicationController
	def new
	end

	def create
		user = User.find_by_email_and_username(params[:email],params[:username])
		if user
			user.send_password_reset 
			redirect_to root_path, :notice => "Um e-mail foi enviado com as instruções para #{:email}."
		else
			render 'new', :notice => "Email ou nome de usuário inválidos"
		end
	end

	def edit

		@user = User.find_by_password_reset_token(params[:id])
		
		if !@user
			redirect_to root_url, :notice => "A senha já foi alterada."
		end
	end

	def update
		@user = User.find_by_password_reset_token!(params[:id])
	
		if @user.password_reset_sent_at < 2.hours.ago
			redirect_to new_password_reset_path, :alert => "O link de redefinição de senha expirou."
		else
			new_password = params[:user][:password]
			if new_password == params[:user][:password_confirmation]
				@user.update_attribute(:password, new_password)
				@user.update_attribute(:password_reset_token, nil)
				redirect_to root_url, :notice => "Senha Redefinida!"			
			else
				redirect_to edit_password_reset_path, :notice => "Senha e Confirmação não conferem"
			end			
		end
	end
	
end
