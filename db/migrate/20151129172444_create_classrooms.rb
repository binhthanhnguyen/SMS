class CreateClassrooms < ActiveRecord::Migration
  def change
    create_table :classrooms do |t|
      t.string :name
      t.references :subject, index: true, foreign_key: true
      t.references :lecturer, index: true, foreign_key: true
      t.string :location
      t.date :start_date
      t.date :end_date

      t.timestamps null: false
    end
  end
end
