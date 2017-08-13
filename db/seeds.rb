require 'random_data'

10.times do
	Wiki.create!(
		title: RandomData.random_sentence,
		body:  RandomData.random_paragraph
	)
end

puts "Seeding finishd:"

puts "#{Wiki.count} wiki's created!"