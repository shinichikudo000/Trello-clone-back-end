class CreateColors < ActiveRecord::Migration[7.1]
  def change
    create_table :colors do |t|
      t.string :color
      t.string :name
      
      t.timestamps
    end
  end
end

# workspace has many label (which label referencing to color table)
# each card can have label which should the label is based on the labels in workspace
