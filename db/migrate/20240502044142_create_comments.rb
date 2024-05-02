class CreateComments < ActiveRecord::Migration[7.1]
  def change
    create_table :comments do |t|
      t.references :user, foreign_key: true, null: false
      t.references :card, foreign_key: true, null: false
      t.string :comment, null: false
      t.boolean :is_edited, default: nil

      t.timestamps
    end
  end
end
