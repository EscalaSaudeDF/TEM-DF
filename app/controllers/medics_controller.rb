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
	end
end
