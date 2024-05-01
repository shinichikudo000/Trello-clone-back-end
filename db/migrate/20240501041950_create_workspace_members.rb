class CreateWorkspaceMembers < ActiveRecord::Migration[7.1]
  def change
    create_table :workspace_members do |t|
      t.references :user, foreign_key: true, null: false
      t.references :workspace, foreign_key: true, null: false

      t.timestamps
    end

    add_index :workspace_members, [:user_id, :workspace_id], unique: true
  end
end
