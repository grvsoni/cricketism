class CreateTournaments < ActiveRecord::Migration
  def change
    create_table :tournaments do |t|
      t.string :name
      t.integer :match_type_id
      t.integer :level_id
      t.integer :user_id

      t.timestamps
    end
  end
end
