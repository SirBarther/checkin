class Student < ActiveRecord::Base
	include PgSearch
  paginates_per 5
	multisearchable against: [:f_name, :l_name, :tag]

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

  def self.search(search)
    if !search.nil? && !search.blank?
      Student.where("f_name LIKE ?", "%#{search}%")
    else
      Student.all
    end
  end

end
