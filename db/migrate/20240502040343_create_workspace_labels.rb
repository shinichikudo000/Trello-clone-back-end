class CreateWorkspaceLabels < ActiveRecord::Migration[7.1]
  def change
    create_table :workspace_labels do |t|
      t.references :color, foreign_key: true, null: false
      t.string :title

      t.timestamps
    end
  end
end
