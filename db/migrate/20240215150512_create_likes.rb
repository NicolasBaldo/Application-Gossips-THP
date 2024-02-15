class CreateLikes < ActiveRecord::Migration[7.1]
  def change
    create_table :likes do |t|
      t.references :user, null: false, foreign_key: true
      t.references :gossip, null: false, foreign_key: true

      t.timestamps
    end

    add_column :gossips, :likes_count, :integer, default: 0
  end
end