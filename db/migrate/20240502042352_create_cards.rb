class CreateCards < ActiveRecord::Migration[7.1]
  def change
    create_table :cards do |t|
      t.references :list, foreign_key: true, null: false
      t.references :board, foreign_key: true, null: false
      t.string :title, null: false
      t.string :description
      t.integer :position
      t.datetime :due_date, default: nil
      t.datetime :start_date, default: nil
      t.datetime :due_date_reminder, default: nil
      t.boolean :is_complete, default: false
      
      t.timestamps
    end
  end
end 
