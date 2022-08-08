require 'faker'
require 'table_print'

Faker::Config.locale = 'en-GB'

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
tp users.sample, except: %i[created_at updated_at]

until Event.count == 20
  Event.create!(
    admin: users.sample,
    start_date: Faker::Date.forward(days: 30),
    title: Faker::Book.title,
    location: Faker::Address.city,
    duration: rand(1..12) * 5,
    description: Faker::Quote.yoda,
    price: rand(1..1000)
  )
end
events = Event.all

puts "\n"
puts '~' * 50
puts "\n"
print "SAMPLE EVENT: \n\n"
tp events.sample, except: %i[created_at updated_at]

until Attendance.count == 100
  Attendance.create!(
    attendee: users.sample,
    event: events.sample
  )
end
attendances = Attendance.all

puts "\n"
puts '~' * 50
puts "\n"
puts "SAMPLE ATTENDANCE: \n\n"
tp attendances, except: %i[created_at updated_at]

puts "\n"
puts '~' * 50
puts "\n"
