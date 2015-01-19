class Location < ActiveRecord::Base
	has_many :events
	has_many :students, through: :events

	validates :city, presence: true
	validates :state, presence: true
	validates :country, presence: true
end
