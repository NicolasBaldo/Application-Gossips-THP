class AddLikesCountToGossips < ActiveRecord::Migration[7.1]
  def change
    add_column :gossips, :likes_count, :integer
  end
end
