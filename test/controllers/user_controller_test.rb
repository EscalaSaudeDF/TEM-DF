require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  	test "should get index" do
  		get :index
    	assert_response :success
    	assert_not_nil assigns(:users)
  	end

  	#tem algo errado
  	#test "should password is equals password_confirmation" do
  	#end

  	test "should get new" do
  		get :new
  		assert_response :success
  	end

  	test "should create user" do
  		assert_difference('User.count') do
      		post :create, user: {username: "test", email: "test@test.com", password: "test", password_confirmation: "test" }
    	end

    	assert_redirected_to root_path(assigns(:user))
  	end

 	#test "should show user" do
  	#	get :show, id: @user
  	#	assert_response :success
  	#end
end
