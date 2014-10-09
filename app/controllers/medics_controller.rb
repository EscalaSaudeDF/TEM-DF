class MedicsController < ApplicationController
	
	def index
  		@medics = Medic.search(params[:list_specility])
	end
end
