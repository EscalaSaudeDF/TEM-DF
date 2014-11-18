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
		body: "From: " + email +"\nNome: "+ name + "\n\n" + message
		)
  end

  def confimation_email (id, token_email, email)

    link = 'http://0.0.0.0:3000/confirmation/'+ id.to_s() +'/'+ token_email.to_s()

    mail(
    to: email,
    subject: 'Confirme seu cadastro em TEM-DF!',
    body: "Confirme seu cadatro no link abaixo:\n\n#{link}")
  end  
end

