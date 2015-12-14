class Student < ActiveRecord::Base
  belongs_to :user
  has_many :classroom_students
  has_many :classrooms, through: :classroom_students
  has_many :marks
  has_many :subjects, through: :marks
  belongs_to :major
  validates :grade_point_average, numericality: {greater_than_or_equal_to: 0, less_than_or_equal_to: 4}
  has_many :enrollments
  has_many :courses, through: :enrollments
end
