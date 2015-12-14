class Course < ActiveRecord::Base
  validates :name, presence: true
  has_many :subjects
  has_many :enrollments
end

