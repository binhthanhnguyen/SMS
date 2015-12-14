class CreateSubjects < ActiveRecord::Migration
  def change
    create_table :subjects do |t|
      t.string :name
      t.integer :credits
      t.text :description
      t.references :course, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
