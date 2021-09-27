class CreateExercise < ActiveRecord::Migration[6.0]
  def change
    create_table :exercises do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name, null: false
      t.integer :records_count, default: 0
      
      t.timestamps
    end
  end
end
