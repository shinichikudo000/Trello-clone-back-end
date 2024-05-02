class CreateBoards < ActiveRecord::Migration[7.1]
  def change
    create_table :boards do |t|
      t.string :name, null: false
      t.integer :visibility, default: 0
      t.string :description, default: nil
      t.integer :role, default: 0
      t.check_constraint 'visibility_check',  'visibility <= 3'
      t.check_constraint 'role_check', 'role <= 1'

      t.timestamps
    end
  end
end

# background => image or color