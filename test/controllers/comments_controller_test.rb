require 'test_helper'

class CommentsControllerTest < ActionController::TestCase
  
  	fixtures :comments, :users

  	def setup
  		@comment = comments(:one)
  	end

  	test "should disable a comment" do
  		get :disable_report , comment_id: @comment.id 
  		assert_equal false , assigns(:comment).report
  	end

  	test "should deactivate a comment" do
  		get :deactivate , comment_id: @comment.id 
  		assert_equal false , assigns(:comment).comment_status
  	end

  	test "should reactivate a comment" do
  		get :reactivate , comment_id: @comment.id 
  		assert_equal true , assigns(:comment).comment_status
  	end

  	test "should get all comments reported, if user is admin" do
  		@user = users(:admin)
      session[:remember_token] = @user.id
      get :reports 
        
  		assert_response :success
  	end

    test "shouldn't get all comments reported without admin" do
      get :reports 
      
      assert_redirected_to root_path
    end
end
