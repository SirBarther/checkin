class Event < ActiveRecord::Base
	has_many :locations
	belongs_to :users
	accepts_nested_attributes_for :locations

	validates :tag_id, length: { is: 8 }, uniqueness: true
	validates :location_id, presence: true

	def new
		binding.pry
	end

	def create
		binding.pry
	end
end