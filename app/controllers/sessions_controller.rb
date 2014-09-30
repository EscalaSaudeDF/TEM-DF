class SessionsController < ApplicationController
    def index
    end

    def create
        user = User.authenticate(params[:username], params[:password])

        if user
            session[:user_id] = user.id
            redirect_to root_path, :notice => "Welcome... we miss you! :D"
        else
            flash.now.alert = "Usuario ou senha invalidos"
            render "index"
        end
    end

    def destroy
        session[:user_id] = nil
        redirect_to root_path, :notice => "Bye! Come back soon! :)"
    end
end
