class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user, :list_speciality, :list_work_unit_name

  	def current_user
  		@current_user ||= User.find(session[:user_id]) if session[:user_id]
  	end
	
	def index
		list_speciality
		list_work_unit_name
	end

  private
	def list_speciality
		@medic= Medic.all
		@speciality = Array.new

		@medic.each do |medic|
			unless @speciality.include?(medic.speciality)
				@speciality.push(medic.speciality)
			end
		end
		return @speciality
	end

	def list_work_unit_name
		@work_unit = WorkUnit.all
		@work_unit_name = Array.new

		@work_unit.each do |work_unit|
			unless @work_unit_name.include?(work_unit.name)
				@work_unit_name.push(work_unit.name)
			end
		end
		return @work_unit_name
	end

	#def list_speciality
	#	@speciality = Array.new

	#	@medic.each do |medic|
	#		unless @speciality.include?(medic.speciality)
	#			@speciality.push(medic.speciality)
	#		end
	#	end
	#end
	#def list_work_unit_name
	#	@work_unit_name = Array.new

	#	@work_unit.each do |work_unit|
	#		unless @work_unit_name.include?(work_unit.name)
	#			@work_unit_name.push(work_unit.name)
	#		end
	#	end
	#end
end
