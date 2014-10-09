class MedicsController < ApplicationController
	
	def results
  		@medics = Medic.search(params[:list_specility])
	end
end
