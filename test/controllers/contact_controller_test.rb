require 'test_helper'

class ContactControllerTest < ActionController::TestCase
  

  	test "should get new" do
		get :new
		assert_response :success
	end

	test "should send mail" do

		post :create, {subject: "assunto",message: "mensagem Qualquer",
			email: "roberto@gmail.com",name: "Roberto"}
		assert_redirected_to root_path
	end

end
