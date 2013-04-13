# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Emanuel', :city => cities.first)

AuthCode.create(name: 'initiate', code: 'gthkn-initiates-2013-8890')
AuthCode.create(name: 'member', code: 'gthkn-members-2013-19928')