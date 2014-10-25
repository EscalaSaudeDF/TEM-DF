require 'user'
require 'medic'

class Rating < ActiveRecord::Base
	belongs_to :user
	belongs_to :medic
end
