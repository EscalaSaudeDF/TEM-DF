class Medic < ActiveRecord::Base
	belongs_to :work_unit
	has_many :schedules
end
