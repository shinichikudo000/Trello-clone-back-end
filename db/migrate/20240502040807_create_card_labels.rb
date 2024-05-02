class CreateCardLabels < ActiveRecord::Migration[7.1]
  def change
    create_table :card_labels do |t|
      t.references :card, foreign_key: true, null: false
      t.references :workspace_label, foreign_key: true, null: false
      
      t.timestamps
    end
  end
end
