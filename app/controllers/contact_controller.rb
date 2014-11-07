class ContactController < ApplicationController

    def new
    end

    def create
		email = TemdfMailer.send_mail(params[:subject], 
		                      params[:message], 
		                      params[:email], 
		                      params[:name])
		email.deliver
		redirect_to root_path
    end

end
