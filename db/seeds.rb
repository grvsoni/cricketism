# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

admin = Role.find_or_create_by({:name => "Admin", :login_role => false})
Role.find_or_create_by({:name => "Player", :login_role => true})
Role.find_or_create_by({:name => "Club Admin", :login_role => true})
Role.find_or_create_by({:name => "Official", :login_role => true})
Role.find_or_create_by({:name => "Groundsman", :login_role => true})
Role.find_or_create_by({:name => "Umpire", :login_role => true})
user = User.create({
                      "username"=>"someone",
                      "email"=>"someone@gmail.com",
                      "password"=>"changeme",
                      "password_confirmation"=>"changeme",
                      "role_ids"=>["#{admin.id}"],
                      "confirmed_at" => Time.now,
                      "confirmation_token" => nil
                    })

Level.find_or_create_by({:level => "Junior"})
Level.find_or_create_by({:level => "School"})
Level.find_or_create_by({:level => "District"})
Level.find_or_create_by({:level => "City"})
Level.find_or_create_by({:level => "State"})
Level.find_or_create_by({:level => "Zone"})
Level.find_or_create_by({:level => "National"})
Level.find_or_create_by({:level => "International"})