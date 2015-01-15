class Student < ActiveRecord::Base
	has_many :events
	has_many :locations, through: :events

	validates :f_name, 
						presence: true,
            length: { minimum: 3 }

	validates :l_name, 
						presence: true,
            length: { minimum: 3 }            
	
	validates :tag, 
						presence: true,
            length: { is: 8 },
            uniqueness: true

end