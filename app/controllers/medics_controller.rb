class MedicsController < ApplicationController
	
	def results
		if params[:list_specility]!= "Informe a Especialidade" || params[:list_work_unit_name]!= "Informe a Região"
  			@medics = Medic.search(params[:list_specility], params[:list_work_unit_name])
  		else
  			flash.now.alert="Escolha um campo."
  			render "home/index"
  		end
	end

	def profile
		@medic = Medic.find_by_id(params[:id])
		@work_unit = WorkUnit.find_by_id(@medic.work_unit_id)
		@comment = Comment.new
	end

	def create_comment
		@user = User.find_by_id(session[:remember_token])
		@medic = Medic.find_by_id(params[:medic_id])
		if @user
			@comment = Comment.new(content: params[:content], date: Time.now,medic: @medic, user: @user, comment_status: true, report: false)

			if @comment.save
	        	redirect_to profile_path(@medic)
	        else
				flash.now.alert = "O comentario não foi salvo."
				redirect_to profile_path(@medic)
			end
		else
			flash.now.alert = "Acesse sua conta para comentar."
			redirect_to login_path
		end
  	end

  	def create_relevance
  		@user = User.find_by_id(session[:remember_token])
  		@comment = Comment.find_by_id(params[:id])

  		if @user && @comment
  			@relevance = Relevance.new(value: params[:value], user: @user, comment: @comment)
  			if @relevance.save
	        	redirect_to profile_path(@medic)
	        else
				flash.now.alert = "Não foi possível avaliar."
				redirect_to profile_path(@medic)
			end
  		else
  			flash.now.alert = "Não foi possível avaliar."
  			redirect_to profile_path(@medic)
  		end

  	end
end
