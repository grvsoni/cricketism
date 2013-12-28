class AddColumnLoginRoleInRoles < ActiveRecord::Migration
  def up
    add_column :roles, :login_role, :boolean, :default => true
    Role.find_by_name("Admin").update_attribute(:login_role, false)
  end

  def down
    remove_column :login_role, :roles, :boolean, :default => true
  end
end
