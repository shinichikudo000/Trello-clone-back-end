class CreateActivities < ActiveRecord::Migration[7.1]
  def change
    create_table :activities do |t|
      t.references :board, foreign_key: true, null: false
      t.references :card, foreign_key: true
      t.references :user, foreign_key: true, null: false
      t.string :activity, null: false
      t.integer :tag, default: 0

      t.timestamps
    end
  end
end