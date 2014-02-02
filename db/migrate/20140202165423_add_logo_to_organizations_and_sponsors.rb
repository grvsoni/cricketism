class AddLogoToOrganizationsAndSponsors < ActiveRecord::Migration
  def up
    change_table :organizations do |t|
      t.attachment :logo
    end

    change_table :sponsors do |t|
      t.attachment :logo
    end

    change_table :tournaments do |t|
      t.attachment :logo
    end
  end

  def down
    drop_attached_file :organizations, :logo
    drop_attached_file :sponsors, :logo
  end
end
