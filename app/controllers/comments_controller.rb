class CommentsController < ApplicationController
	def reports
		@user = User.find_by_id(session[:remember_token])

      	if @user && @user.username == "admin"
			@reported_comments = Comment.all.where(report: true)
		else
			redirect_to root_path
		end
	end

	def deactivate
		@comment = Comment.find_by_id(params[:comment_id])
		if @comment
			@comment.update_attribute(:comment_status, false)
		end
		redirect_to reported_comments_path
	end

	def reactivate
		@comment = Comment.find_by_id(params[:comment_id])
		if @comment
			@comment.update_attribute(:comment_status, true)
		end
		redirect_to reported_comments_path
	end

	def disable_report
		@comment = Comment.find_by_id(params[:comment_id])
		if @comment
			@comment.update_attribute(:report, false)
		end
		redirect_to reported_comments_path
	end
end
