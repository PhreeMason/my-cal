# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
(1..12).each do |n|
  cc = Date.today
  cc += n.month
  puts cc.end_of_month.strftime("%B")
  puts cc.end_of_month.day
end

User.destroy_all
Calendar.destroy_all
Month.destroy_all

# puts Date.today.end_of_month
