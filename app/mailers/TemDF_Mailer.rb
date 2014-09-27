class TemDFMailer < ActionMailer::Base
	default from: 'valenca.karine@gmail.com'

	def new_medic_notify(recipient)
		mail(:to => 'valenca.karine@gmail.com', :subject => "Nova solicitacao de medico")
	end
end