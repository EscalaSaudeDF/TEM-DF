class Medic < ActiveRecord::Base
	belongs_to :workunit
	has_many :shedules
end
