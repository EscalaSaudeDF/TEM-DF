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
		return get(@medic)
	end

	def list_work_unit_name
		@work_unit = WorkUnit.all
		return get(@work_unit)
	end

	def get(object1)
		@speciality = Array.new
		@work_unit_name = Array.new

		medic = true

		object1.each do |it|
			if it.kind_of?(Medic)
				unless @speciality.include?(it.speciality)
					@speciality.push(it.speciality)
				end
			else
				unless @work_unit_name.include?(it.name)
					@work_unit_name.push(it.name)
				end
				medic = false
			end
		end

		if medic
			return @speciality
		end
		
		return @work_unit_name
	end
end
