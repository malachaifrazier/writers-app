# puts 'CREATING ROLES'
# Role.create([
#   { name: 'admin' }, { name: 'producer' },
#   { name: 'super_producer' }, { name: 'vendor' } ], without_protection: true)
# BetaUser.last.email.split("@").first
# SecureRandom.hex(5)+"#{b.split("@").first}"
#
puts 'SETTING UP DEFAULT USER LOGIN'

user = User.create!(
  email: Figaro.env.super_email,
  password: 'password',
  password_confirmation: 'password',
  first_name: Figaro.env.super_first_name,
  last_name: Figaro.env.super_last_name,
)

puts '------------'
puts '------------'
puts '------------'
puts '------------'

puts 'New user created: ' << user.email

puts '------------'
puts '------------'
puts '------------'
puts '------------'

puts 'ADDING ADMIN ROLE!'

puts '------------'
puts '------------'
puts '------------'
puts '------------'

user.add_role :admin

puts '------------'
puts '------------'
puts '------------'
puts '------------'

puts 'User now has Role: ' << user.roles.first.name

puts '------------'
puts '------------'
puts '------------'
puts '------------'

puts 'This is your email: '           << user.email
puts 'Login & change this password: ' << user.password


user2 = User.create!(
  email: 'app_user@gmail.com',
  password: 'password',
  password_confirmation: 'password',
  first_name: 'Jane',
  last_name: 'Doe',
)

puts '------------'
puts '------------'
puts '------------'
puts '------------'

puts 'New user created: ' << user2.email

puts '------------'
puts '------------'
puts '------------'
puts '------------'

puts 'ADDING ADMIN ROLE!'

puts '------------'
puts '------------'
puts '------------'
puts '------------'

user2.add_role :app_user

puts '------------'
puts '------------'
puts '------------'
puts '------------'

puts 'User now has Role: ' << user2.roles.first.name
