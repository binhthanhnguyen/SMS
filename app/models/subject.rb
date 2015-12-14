class Subject < ActiveRecord::Base
  belongs_to :course
  has_many :marks
  has_many :students, through: :marks
  validates :name, presence: true
  validates :credits, presence: true,
    numericality: {greater_than_or_equal_to: 0, less_than_or_equal_to: 15}
end
