class Medic < ActiveRecord::Base
	has_many :work_units
	has_many :schedules
end
