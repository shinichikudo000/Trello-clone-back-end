class CreateBoardLabels < ActiveRecord::Migration[7.1]
  def change
    create_table :board_labels do |t|
      t.references :color, foreign_key: true, null: false
      t.string :title

      t.timestamps
    end
  end
end

#change file name