class AlterClubs < ActiveRecord::Migration
  def up
    remove_column :clubs, :level
    add_column :clubs, :level_id, :integer
  end

  def down
    remove_column :clubs, :level_id
    add_column :clubs, :level, :string
  end
end
