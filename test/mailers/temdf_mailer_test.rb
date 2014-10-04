require 'test_helper'

class TemdfMailerTest < ActionMailer::TestCase
	test "welcome mail" do
		email = TemdfMailer.welcome_email.deliver
    	assert_not ActionMailer::Base.deliveries.empty?
		assert_equal ['temdf.unb@gmail.com'], email.from
		assert_equal ['temdf.unb@gmail.com'], email.to
		assert_equal 'Nova solicitacao de medico', email.subject
		#assert_equal read_fixture('arquivo_medico').join, email.body.to_s
	end
end
