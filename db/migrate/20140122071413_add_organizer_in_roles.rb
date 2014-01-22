class AddOrganizerInRoles < ActiveRecord::Migration
  def up
    Role.find_or_create_by({:name => "Organizer", :login_role => true})
  end
end
