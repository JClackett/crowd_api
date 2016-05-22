10.times do
	User.create(
		email: Faker::Internet.email,
		name: Faker::Name.name,
		uid: Faker::Number.number(10),
	)
end

10.times do 
	Event.create(
		title: Faker::Hacker.noun,
		description: Faker::Hacker.say_something_smart,
		latitude: Faker::Address.latitude,
		longitude: Faker::Address.longitude,
		endtime: Faker::Time.forward(23, :morning),
		user: User.all.sample
	)
end