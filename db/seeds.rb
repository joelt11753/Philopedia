require 'random_data'

15.times do
	User.create!(
		name:     Faker::LordOfTheRings.character,
		email:    Faker::Internet.safe_email,
		password: Faker::Internet.password,
		role:     'standard'
	)
end

users = User.all

# Public Wiki's
5.times do
	Wiki.create!(
		title:   Faker::Hobbit.quote,
		body:    RandomData.random_paragraph,
		private: false,
		user:    users.sample
	)
end

# Private Wiki's
4.times do
	Wiki.create!(
		title:   Faker::Hobbit.quote,
		body:    RandomData.random_paragraph,
		private: true,
		user:    users.sample
	)
end

# Admin user
User.create!(
	name:     'Joel Tennant',
	email:    'joel_tennant@yahoo.com',
	password: 'testing',
	role:     'admin'
)

# Premium User
User.create!(
	name:     Faker::LordOfTheRings.character,
	email:    'premium@email.com',
	password: 'testing',
	role:     'premium'
)

# Standard User
User.create!(
	name:     Faker::LordOfTheRings.character,
	email:    'standard@email.com',
	password: 'testing',
	role:     'standard'
)

puts "Seeding finishd:"

puts "#{Wiki.count} wiki's created!"
puts "#{User.count} users created!"