class CommentController < ApplicationController

	def create
		@user = User.find_by_id(session[:remember_token])
		if @user
			@comment = Comment.new(comment_params)
			@comment.comment_status = true
			@comment.report = false
			if params[:content][:user_id][:medic_id]
				if @comment.save
				upload params[:user][:document]
                redirect_to root_path	
                else
					flash.now.alert = "O comentario não foi salvo."
					redirect_to root_path
				end
			else
				flash.now.alert = "Preencha o campo de comentário."
			end
		else
			flash.now.alert = "Acesse sua conta para comentar."
			redirect_to root_path
		end
  	end

  	private
        def comment_params
            params.require(:comment).permit(:content, :comment_status, :report, :user_id, :medic_id)
        end
end
