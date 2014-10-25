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

	def create_rating 
		@user = User.find_by_id(session[:remember_token])
		@medic = Medic.find_by_id(params[:medic][:id])
		if @user
  			@rating = Rating.new(grade: params[:grade], user: @user, medic: @medic)
  			@rating.save
  		else
  			redirect_to root_path  notice: 'Usuário não logado!'
  		end	
  	end	
end
