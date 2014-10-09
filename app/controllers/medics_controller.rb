class MedicsController < ApplicationController
	
	def results
  			@medics = Medic.search(params[:list_specility], params[:list_work_unit_name])

	end
end
