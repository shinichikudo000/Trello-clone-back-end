class CreateBoardMembers < ActiveRecord::Migration[7.1]
  def change
    create_table :board_members do |t|
      t.references :board, foreign_key: true, null: false
      t.references :user, foreign_key: true, null: false
      t.integer :role, default: 0
      
      t.timestamps
    end
  end
end
