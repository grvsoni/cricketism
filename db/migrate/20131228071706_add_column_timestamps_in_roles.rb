class AddColumnTimestampsInRoles < ActiveRecord::Migration
  def change
    change_table :roles do |t|
      t.references :user
      t.timestamps
    end
  end
end
