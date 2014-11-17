require 'test_helper'

class UserMailerTest < ActionMailer::TestCase
	fixtures :users

  test "password_reset" do
  	@user = users(:roberto)
    mail = UserMailer.password_reset(@user)
    assert_equal "Password Reset", mail.subject
    assert_equal ["roberto@gmail.com"], mail.to
    assert_equal ["temdf.unb@gmail.com"], mail.from
    assert_match UserMailer.password_reset(@user).body.encoded, mail.body.encoded
  end

end
