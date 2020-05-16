# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
emails = [ENV['EMAIL1'], ENV['EMAIL2'], ENV['EMAIL3']]
pass = "password"

emails.each_with_index do |email, n|
User.create!(
  name: "name-#{n+1}",
  email: email,
  password: pass,
  password_confirmation: pass
)
end

Admin.create!(
  email: ENV['EMAIL4'],
  password: pass,
  password_confirmation: pass
)