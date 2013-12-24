class CreateClubs < ActiveRecord::Migration
  def change
    create_table :clubs do |t|
      t.string :name
      t.string :war_cry
      t.string :level, :default => "School"
      t.string :status
      t.string :city
      t.string :state
      t.string :country, :default => "India"
      t.boolean :is_verified, :default => false
      t.boolean :is_registered, :default => false
      t.date :verification_date
      t.date :registration_date

      t.timestamps
    end
  end
end
