class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.integer :user_id
      t.integer :club_id
      t.integer :team_id
      t.string :batting_hand
      t.string :bowling_hand
      t.string :skill
      t.string :batting_style
      t.string :bowling_style
      t.boolean :is_wicketkeeper

      t.timestamps
    end
  end
end
