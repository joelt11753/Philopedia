require 'random_data'

5.times do
	User.create!(
		email:    RandomData.random_email,
		password: RandomData.random_sentence,
		role:     'standard'
	)
end

users = User.all

10.times do
	Wiki.create!(
		title:   RandomData.random_sentence,
		body:    RandomData.random_paragraph,
		private: false,
		user:    users.sample
	)
end

User.create!(
	email:    'joel_tennant@yahoo.com',
	password: 'testing',
	role:     'admin'
)

puts "Seeding finishd:"

puts "#{Wiki.count} wiki's created!"
puts "#{User.count} users created!"