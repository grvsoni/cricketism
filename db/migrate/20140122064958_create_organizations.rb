class CreateOrganizations < ActiveRecord::Migration
  def change
    create_table :organizations do |t|
      t.string :name
      t.boolean :is_active, :default => true
      t.references :user

      t.timestamps
    end
  end
end
