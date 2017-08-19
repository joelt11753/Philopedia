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

28.times do
	Wiki.create!(
		title:   Faker::Hobbit.quote,
		body:    RandomData.random_paragraph,
		private: false,
		user:    users.sample
	)
end

User.create!(
	name:     'Joel Tennant',
	email:    'joel_tennant@yahoo.com',
	password: 'testing',
	role:     'admin'
)

puts "Seeding finishd:"

puts "#{Wiki.count} wiki's created!"
puts "#{User.count} users created!"