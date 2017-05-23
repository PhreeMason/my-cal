# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

cc = Date.today - 2.month
puts cc.end_of_month.strftime("%B")
puts cc.at_beginning_of_month.wday
puts cc.at_beginning_of_month
puts cc.month 
puts DateTime.new(2017)

User.destroy_all
Calendar.destroy_all
Month.destroy_all


# puts Date.today.end_of_month
