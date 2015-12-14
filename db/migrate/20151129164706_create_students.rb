class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.references :user, index: true, foreign_key: true
      t.date :date_of_birth
      t.date :date_of_joining
      t.date :date_of_leaving
      t.references :major, index: true, foreign_key: true
      t.float :grade_point_average

      t.timestamps null: false
    end
  end
end
