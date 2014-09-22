class SessionsController < ApplicationController
  def new
  end

  def create

  	user = User.autenticate(params[:username], params[:password])

  	if user
  		session[:user_id] = user.id
  		redirect_to root_url :notice => "Logged in !!"

  	else
  		flash.now.alert = "Usuario ou senha invalidos"
  		render "new"
  	end
  end

end
