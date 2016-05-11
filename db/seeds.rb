10.times do 
	event = Event.create(
		title: Faker::Hacker.noun,
		description: Faker::Hacker.say_something_smart,
		lat: Faker::Address.latitude,
		long: Faker::Address.longitude,
		endtime: Faker::Time.forward(23, :morning),
		user: User.first
	)
end