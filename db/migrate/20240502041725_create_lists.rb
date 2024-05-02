class CreateLists < ActiveRecord::Migration[7.1]
  def change
    create_table :lists do |t|
      t.references :board, foreign_key: true, null: false
      t.string :name, null: false
      t.integer :position

      t.timestamps
    end
  end
end
