require 'test_helper'

class SessionsControllerTest < ActionController::TestCase
	def setup
		@user = users(:roberto)
	end

	test "should get new" do
		get :new
		assert_response :success
	end

	test "should login" do
		dave = users(:roberto)
		post :create, :username => dave.username, :password => '1234'
		assert_redirected_to root_path
		assert_equal dave.id, session[:user_id]
	end

	test "should not login" do
		dave = users(:roberto)
		post :create, :username => dave.username, :password => '12'
		assert_response :success
		assert_not_equal dave.id, session[:user_id]
	end

	test "should log out" do
		dave = users(:roberto)
		delete :destroy
		assert_equal nil, session[:user_id]
		assert_redirected_to root_path
	end
end
