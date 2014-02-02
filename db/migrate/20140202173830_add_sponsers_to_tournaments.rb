class AddSponsersToTournaments < ActiveRecord::Migration
  def change
    create_table :sponsors_tournaments, :id => false do |t|
      t.references :sponsor
      t.references :tournament
    end
  end
end
