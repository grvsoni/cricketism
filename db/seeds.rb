# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Role.create({:name => "Admin", :login_role => false})
Role.create({:name => "Player", :login_role => true})
Role.create({:name => "Club Admin", :login_role => true})
Role.create({:name => "Official", :login_role => true})
Role.create({:name => "Groundsman", :login_role => true})
Role.create({:name => "Umpire", :login_role => true})