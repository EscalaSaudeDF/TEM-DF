require 'work_unit'

class Medic < ActiveRecord::Base
	belongs_to :work_unit
	has_many :schedules, :comments

	def self.search(speciality, work_unit)

		if work_unit != "Informe a Região"
			@work_unit_instance = WorkUnit.find_by_name(work_unit)
			
			if speciality != "Informe a Especialidade"
				where("speciality =  ? AND work_unit_id = ?", speciality,@work_unit_instance.id).all
			else
				where("work_unit_id = ?", @work_unit_instance.id).all
			end
			
		elsif speciality != "Informe a Especialidade"
			where("speciality =  ?", speciality).all
		else 
		    all
		end
	end
end
