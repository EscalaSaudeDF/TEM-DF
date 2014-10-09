class ParsersController < ApplicationController

	def index
		render "index"
	end

	def upload
		document = params[:document]
		if document
			File.open(Rails.root.join('public', 'csv', 'schedules.csv'), 'wb') do |file|
				file.write(document.read)
			end
			Parser.save_data('public/csv/schedules.csv')
			redirect_to root_path
		end
	end
end
