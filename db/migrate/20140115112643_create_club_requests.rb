class CreateClubRequests < ActiveRecord::Migration
  def change
    create_table :club_requests do |t|
      t.integer :user_id
      t.string :club_id

      t.timestamps
    end
  end
end
