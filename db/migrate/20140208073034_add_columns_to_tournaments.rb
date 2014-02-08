class AddColumnsToTournaments < ActiveRecord::Migration
  def change
    add_column :tournaments, :description, :text
    add_column :tournaments, :venue_id, :integer
    add_column :tournaments, :fees, :float
    add_column :tournaments, :start_date, :date
    add_column :tournaments, :end_date, :date
    add_column :tournaments, :duration, :integer
  end
end
