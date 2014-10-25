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
	end

	def rating 
		@user = User.find_by_id(session[:remember_token])
		@medic = Medic.find_by_id(params[:medic_id])
		@rating = Rating.find_by_user_id_and_medic_id(@user.id, @medic.id)

		if @user == nil
			redirect_to login_path, :notice => "O Usuário necessita estar logado"
		elsif @rating
            update_rating(@rating , params[:grade])
            redirect_to root_path, notice: 'Avaliação Alterada!'
		else
			create_rating(@user, @medic)
			redirect_to action:"profile",id: params[:medic_id]#,:notice => "O Usuário necessita estar logado"
		end
  	end

  	private 
  		def create_rating(user, medic)
			@rating = Rating.new(grade: params[:grade], user: user, medic: medic, date: Time.new)
			@rating.save
	  	end

	  	def update_rating(rating,grade)
			rating.update_attribute(:grade , grade)
            rating.update_attribute(:date , Time.new)
	  	end
end
