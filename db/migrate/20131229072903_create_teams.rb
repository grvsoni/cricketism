class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string :name
      t.integer :user_id
      t.integer :club_id
      t.boolean :active, :default => true

      t.timestamps
    end
  end
end
