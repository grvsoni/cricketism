class CreateMatchTypes < ActiveRecord::Migration
  def change
    create_table :match_types do |t|
      t.string :name
      t.integer :player_count
      t.integer :max_over_batting
      t.integer :max_run_batting
      t.string :max_over_bowling
      t.integer :innings
      t.integer :balls_per_over
      t.boolean :rebowl_noball
      t.integer :noball_runs
      t.boolean :dismiss_on_wicket
      t.integer :wicket_value
      t.boolean :last_man_bat

      t.timestamps
    end
  end
end
