class Event < ActiveRecord::Base
	belongs_to :location
	belongs_to :student

	validates :student_tag, length: { is: 8, message: "Must be 8 numbers" }, presence: true
	validates :location_id, presence: true

  def tag=(t_id)
    @student = Student.find_by(tag: t_id)
  end

  def tag
  	student.try(:tag)
  end

  def new
	end

	def create
	end

  def self.list
    @student_array = []
    Event.limit(5).order(:created_at).each do |list|
      @student_array << Student.find_by_tag(list.student_tag)
      # @student_array << list.student
    end
    @student_array
  end

end