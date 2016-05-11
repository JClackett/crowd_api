10.times do 
	event = Event.create(
		title: Faker::Hacker.noun,
		description: Faker::Hacker.say_something_smart,
		lat: Faker::Number.decimal(2, 3),
		long: Faker::Number.decimal(2, 3),
		endtime: Faker::Time.forward(23, :morning),
		user_id: Faker::Number.between(1, 15)
	)
end