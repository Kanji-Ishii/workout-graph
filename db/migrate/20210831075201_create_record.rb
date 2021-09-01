class CreateRecord < ActiveRecord::Migration[6.0]
  def change
    create_table :records do |t|
      t.references :user, null: false, foreign_key: true
      t.string :taining_name, null: false
      t.integer :weight, null:false, default: 0
      t.integer :rep_count, null: false, default: 0
      t.text :note, default: ""
      t.integer :RM, null: false, null: true, default: 0
      
      t.timestamps
    end
  end
end
