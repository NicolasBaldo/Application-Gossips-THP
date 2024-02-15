class AddCityToUsers < ActiveRecord::Migration[7.1]
  def change
    add_reference :users, :city, null: true, foreign_key: true
  end
end