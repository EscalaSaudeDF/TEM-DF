class ContactController < ApplicationController

    def new

    end

    def create
		TemdfMailer.send_mail(params[:subject], params[:message], params[:email], params[:name]).deliver
		redirect_to root_path
    end

end
