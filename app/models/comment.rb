class Comment < ActiveRecord::Base
	belongs_to :user
	belongs_to :medic
	has_many :relevance

	validates :content, presence: true, length: { maximum: 300 }
end
