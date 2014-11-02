require 'test_helper'

class CommentsControllerTest < ActionController::TestCase
  
  	fixtures :comments

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

  	test "should get all comments reported" do
  		get :reports 
  		assert true
  	end
end
