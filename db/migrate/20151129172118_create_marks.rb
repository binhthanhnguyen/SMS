class CreateMarks < ActiveRecord::Migration
  def change
    create_table :marks do |t|
      t.references :student, index: true, foreign_key: true
      t.references :subject, index: true, foreign_key: true
      t.float :value

      t.timestamps null: false
    end
  end
end
