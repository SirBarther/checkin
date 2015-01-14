class Location < ActiveRecord::Base
	has_many :events
	has_many :students, through: :events
end
