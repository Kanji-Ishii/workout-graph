class CreateRecord < ActiveRecord::Migration[6.0]
  def change
    create_table :records do |t|
      t.references :exercise, null: false, foreign_key: true
      t.integer :name_id, null: false
      t.integer :weight, null:false, default: 0
      t.integer :reps_count, null: false, default: 0
      t.text :note, default: ""
      t.integer :RM, null: false, default: 0
      t.date :date, null: false
      
      t.timestamps
    end
  end
end
