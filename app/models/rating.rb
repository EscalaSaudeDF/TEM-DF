class Rating < ActiveRecord::Base
	belongs_to :user
	belongs_to :medic, through: :user
end
