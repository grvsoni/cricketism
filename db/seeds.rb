# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

admin = Role.create({:name => "Admin", :login_role => false})
Role.create({:name => "Player", :login_role => true})
Role.create({:name => "Club Admin", :login_role => true})
Role.create({:name => "Official", :login_role => true})
Role.create({:name => "Groundsman", :login_role => true})
Role.create({:name => "Umpire", :login_role => true})

ActiveRecord::Migration.execute("INSERT INTO `users` (`id`, `email`, `username`, `encrypted_password`, `reset_password_token`, `reset_password_sent_at`, `remember_created_at`, `sign_in_count`, `current_sign_in_at`, `last_sign_in_at`, `current_sign_in_ip`, `last_sign_in_ip`, `confirmation_token`, `confirmed_at`, `confirmation_sent_at`, `unconfirmed_email`, `failed_attempts`, `unlock_token`, `locked_at`, `profile_id`, `created_at`, `updated_at`, `user_id`) VALUES (1,'admin@admin.com','admin','$2a$10$1BqjXgZMjAr1BfeDtgEeWeyYQ5uz4J35yszoCVegB51SwtvhBoig.',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,'2014-01-11 15:26:33','2014-01-11 15:26:12',NULL,0,NULL,NULL,NULL,'2014-01-11 15:26:12','2014-01-11 15:26:33',NULL);")
ActiveRecord::Migration.execute("INSERT INTO `roles_users` (`role_id`, `user_id`) VALUES (#{admin.id},1);")