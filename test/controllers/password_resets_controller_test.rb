require 'test_helper'

class PasswordResetsControllerTest < ActionController::TestCase

	fixtures :users

	def setup
		@user = users(:roberto)
		@lorena = users(:lorena)
	end

	test "should get new" do
		get :new
		assert_response :success
	end

	test "should create" do
		post :create, email: "roberto@gmail.com", username: "Roberto"
		assert_redirected_to root_url
	end

	test "shouldn't create without user" do
		post :create
		assert_template "new"
	end

	test "shouldn't get edit" do
		get :edit, id: "usuario_inexistente"
		assert_redirected_to root_url
	end

	test "should get edit" do
		get :edit, id: "ToLken123"
		assert_response :success
	end

	test "should update" do
		put :update, id: @user.password_reset_token, :user => {:password => "4321", :password_confirmation => "4321"}
		assert_redirected_to root_url
		assert_equal '4321', assigns(:user).password 
	end

	test "shouldn't update user with expired link" do
		put :update, id: @lorena.password_reset_token, :user => {:password => "4321", :password_confirmation => "4321"}
		assert_redirected_to new_password_reset_path
	end

	test "shouldn't update user with wrong password confirmation" do
		put :update, id: @user.password_reset_token, :user => {:password => "4A", :password_confirmation => "A4321"}
		assert_redirected_to edit_password_reset_path
	end		

end
