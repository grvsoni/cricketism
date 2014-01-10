class AddColumnLoginRoleInRoles < ActiveRecord::Migration
  def up
    add_column :roles, :login_role, :boolean, :default => true
  end

  def down
    remove_column :login_role, :roles, :boolean, :default => true
  end
end
