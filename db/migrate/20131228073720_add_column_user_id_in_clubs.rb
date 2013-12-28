class AddColumnUserIdInClubs < ActiveRecord::Migration
  def change
    add_column :clubs, :user_id, :integer
    add_column :venues, :user_id, :integer
    add_column :states, :user_id, :integer
    add_column :cities, :user_id, :integer
    add_column :countries, :user_id, :integer
    add_column :users, :user_id, :integer
    add_column :match_types, :user_id, :integer
    add_column :levels, :user_id, :integer
  end
end
