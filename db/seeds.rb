require 'faker'
require 'table_print'

Faker::Config.locale = 'fr'

until User.count == 50
  User.create(
    email: Faker::Internet.email,
    encrypted_password: Faker::Internet.password,
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    description: Faker::Quote.yoda
  )
end
users = User.all

puts "\n"
puts '~' * 50
puts "\n"
print "SAMPLE USER: \n\n"
tp users, except: %i[created_at updated_at]

until Event.count == 20
  Event.create!(
    admin: users.sample,
    start_date: Faker::Date.forward(days: 30),
    title: Faker::Book.title,
    location: Faker::Address.city,
    duration: [5, 10, 15, 20, 25, 30, 35, 40, 45, 50, 55, 60].sample,
    description: Faker::Quote.yoda,
    price: rand(10..200)
  )
end
events = Event.all

puts "\n"
puts '~' * 50
puts "\n"
print "SAMPLE EVENT: \n\n"
tp events, except: %i[created_at updated_at]

puts "\n"
puts '~' * 50
puts "\n"
