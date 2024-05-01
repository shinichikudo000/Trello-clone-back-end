class CreateWorkspaces < ActiveRecord::Migration[7.1]
  def change
    create_table :workspaces do |t|
      t.string :name, null: false
      t.string :short_name, default: nil
      t.string :description, default: nil
      t.string :website
      t.integer :visibility, default: 0
      t.integer :tier, default: 0

      t.timestamps
    end
  end
end
