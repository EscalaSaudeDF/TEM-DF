require 'test_helper'

class TemdfMailerTest < ActionMailer::TestCase

	test "request_account" do
		email = TemdfMailer.request_account.deliver
    	assert_not ActionMailer::Base.deliveries.empty?
		assert_equal ['temdf.unb@gmail.com'], email.from
		assert_equal ['temdf.unb@gmail.com'], email.to
		assert_equal 'Nova solicitacao de medico', email.subject
		#assert_equal read_fixture('arquivo_medico').join, email.body.to_s
	end

	test "send_mail" do

		subject = "assunto"
		message = "mensagem Qualquer"
		emailname = "roberto@gmail.com"
		name = "Roberto"

		email = TemdfMailer.send_mail(subject, message, emailname, name)
		email.deliver
    	assert_not ActionMailer::Base.deliveries.empty?
		assert_equal ['temdf.unb@gmail.com'], email.from
		assert_equal ['temdf.unb@gmail.com'], email.to
		assert_equal subject, email.subject
		assert_equal "From: " + emailname +"\nNome: "+ name + "\n\n" + message, email.body.decoded
	end

	test "confimation_email" do

		id = 1
		token_email = "12345"
		emailname = "roberto@gmail.com"

		email = TemdfMailer.confimation_email(id, token_email, emailname)
		email.deliver

    	assert_not ActionMailer::Base.deliveries.empty?
		assert_equal ['temdf.unb@gmail.com'], email.from
		assert_equal [emailname], email.to
		assert_equal "Confirme seu cadatro no link abaixo:\n\n"+"http://0.0.0.0:3000/confirmation/"+ id.to_s() +"/"+ token_email.to_s(), email.body.decoded
	end
end
