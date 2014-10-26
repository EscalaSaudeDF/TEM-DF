class MedicsController < ApplicationController
	
	def results
		@medics = Medic.search(params[:list_specility], params[:list_work_unit_name])
		if @medics
  			@medics
  		else
  			flash.now.alert="Escolha um campo."
  			render "home/index"
  		end
	end

	def profile
		@medic = Medic.find_by_id(params[:id])
		@work_unit = WorkUnit.find_by_id(@medic.work_unit_id)
		@average = calculate_average(@medic)
		@ratings = Rating.all.where(medic_id: @medic.id).size
	end

	def rating 
		@user = User.find_by_id(session[:remember_token])
		@medic = Medic.find_by_id(params[:medic_id])
		
		if @user != nil
			@rating = Rating.find_by_user_id_and_medic_id(@user.id, @medic.id)

			if @rating != nil
	            update_rating(@rating , params[:grade])
	            redirect_to action:"profile",id: params[:medic_id], notice: 'Avaliação Alterada!'
			else
				create_rating(@user, @medic)
				redirect_to action:"profile",id: params[:medic_id]#,:notice => "O Usuário necessita estar logado"
			end
		else 
		redirect_to login_path, :notice => "O Usuário necessita estar logado"
		end	
  	end

  	def create_comment
		@comment = Comment.new
		@user = User.find_by_id(session[:remember_token])
		@medic = Medic.find_by_id(params[:medic_id])
		
		if @user
			@comment = Comment.new(content: params[:content], date: Time.now,
				medic: @medic, user: @user, comment_status: true, report: false)

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
  			@relevance = Relevance.new(value: params[:value], user: @user, 
  				comment: @comment)
  			
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

  	private 
  		def create_rating(user, medic)
			@rating = Rating.new(grade: params[:grade], user: user, medic: medic, date: Time.new)
			@rating.save
	  	end

	  	def update_rating(rating,grade)
	  		if grade != "0"
				rating.update_attribute(:grade , grade)
            	rating.update_attribute(:date , Time.new)
            end
	  	end

	  	def calculate_average(medic)
	  		@ratings = Rating.all.where(medic_id: medic.id)

	  		if @ratings.size == 0 
	  			return 0
	  		else 
		  		sum = 0
		  		@ratings.each do |r|
		  			sum += r.grade	
	  			end

				return sum/(1.0*@ratings.size)
	  		end
	  	end
end

