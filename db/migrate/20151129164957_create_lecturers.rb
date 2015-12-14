class CreateLecturers < ActiveRecord::Migration
  def change
    create_table :lecturers do |t|
      t.references :user, index: true, foreign_key: true
      t.date :date_of_birth
      t.date :date_of_joining
      t.decimal :salary

      t.timestamps null: false
    end
  end
end
