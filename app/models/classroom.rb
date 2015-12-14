class Classroom < ActiveRecord::Base
  belongs_to :subject
  belongs_to :lecturer
  has_many :classroom_students
  has_many :students, through: :classroom_students
end
