# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
mike = User.find_by(email: 'mike@example.com')
if User.count < 5
  User.create(
    email: 'mike@example.com',
    first_name: 'mike',
    last_name: 'tester',
    password: 'test1234'
  ) unless mike

  10.times do
    full_name = Faker::Name.name
    user =
      User.create(
        email: Faker::Internet.email,
        first_name: full_name.split(' ').first,
        last_name: full_name.split(' ').last,
        password: 'test1234'
      )
    puts "user created. #{user.first_name} #{'*' * 100}"
  end
else
  puts 'There are already > 5 users in the database'
end

if Movie.count < 20
  20.times do
    movie = Movie.create!(title: Faker::Movie.title)
    puts "created movie: #{movie.title} #{'*' * 10}"
  end
else
  puts 'There are already > 20 movies in the database'
end

if List.count < 10
  default_list_names = [
    'Action', 'Comedy', 'Documentaries', 'Indie', 'Foreign', 'Horror', 'Holidays',
    'SciFi', '80s', 'Old Standbys'
  ]
  default_list_names.each do |name|
    list = List.create!(name: name, owner: mike)
    puts "list created for mike: #{list.name} #{'*' * 100}"
  end

  10.times do
    list = List.create!(name: DEFAULT_LIST_NAMES.sample, owner: User.all.sample)
    puts "list created for #{list.owner.first_name}: #{list.name} #{'*' * 100}"
  end
else
  puts "There are already > 10 lists in the database #{'*' * 100}"
end
