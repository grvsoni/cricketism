class AlterColumnsInProfile < ActiveRecord::Migration
  def up
    remove_column :profiles, :country
    remove_column :profiles, :state
    remove_column :profiles, :city

    add_column :profiles, :country_id, :integer
    add_column :profiles, :state_id, :integer
    add_column :profiles, :city_id, :integer
  end

  def down
    remove_column :profiles, :country_id
    remove_column :profiles, :state_id
    remove_column :profiles, :city_id

    add_column :profiles, :country, :string
    add_column :profiles, :state, :string
    add_column :profiles, :city, :string
  end
end
