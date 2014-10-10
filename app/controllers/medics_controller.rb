class MedicsController < ApplicationController
	
	def results
		if params[:list_specility]!= "Informe a Especialidade" || params[:list_work_unit_name]!= "Informe a Região"
  			@medics = Medic.search(params[:list_specility], params[:list_work_unit_name])
  		else
  			flash.now.alert="Escolha um campo."
  			render "home/index"
  		end
	end
end
