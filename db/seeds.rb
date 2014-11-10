# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create(username: "admin", password: "admin", password_confirmation: "admin",
    account_status: true, email: "admin@admin.com")

User.create(username: "Pepino", password: "pepino", password_confirmation: "pepino",
    account_status: true, email: "pepino@capivara.com")

Parser.save_data('public/csv/schedules_test.csv')
