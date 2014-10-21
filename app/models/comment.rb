class Comment < ActiveRecord::Base
	belongs_to :medic, :user
end
