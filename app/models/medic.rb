class Medic < ActiveRecord::Base
	belongs_to :workunit
	has_many :schedules
end
