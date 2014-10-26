class Relevance < ActiveRecord::Base
	belongs_to :user
	bolongs_to :comment
end
