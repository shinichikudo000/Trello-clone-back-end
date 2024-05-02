class CreateBoards < ActiveRecord::Migration[7.1]
  def change
    create_table :boards do |t|
      t.string :name, null: false
      t.integer :visibility, default: 0
      t.string :description, default: nil

      t.timestamps
    end
  end
end

# background => image or color