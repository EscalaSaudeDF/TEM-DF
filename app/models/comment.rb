class Comment < ActiveRecord::Base
	belongs_to :user
	belongs_to :medic
	has_many :relevance 
end

