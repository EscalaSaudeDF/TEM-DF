class TemdfMailer < ActionMailer::Base
  default from: "temdf.unb@gmail.com"

  def request_account
  	attachments['arquivo_medico.pdf'] = File.read('public/uploads/arquivo_medico')
  	mail(to: 'temdf.unb@gmail.com', subject: 'Nova solicitacao de medico', body: 'solicitacao de cadastro de usuario')
  end

  def send_mail (subject, message, email, name)

   	  mail(
		to: 'temdf.unb@gmail.com',
		subject: subject,
		body: "From: " + email +"\n Nome: "+ name + "\n\n" + message
		)
   end

end

