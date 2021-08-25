
# run with `rails db:seed:replant` to avoid recreating the db
# or to start with the ids back at 1
# rails db:drop && rails db:create && rails db:migrate && rails db:seed

## Users
mike = User.find_by(email: 'mike@example.com')
mike = User.create(
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
  puts "user created. #{user.first_name} #{'*' * 10}"
end

## Movies
100.times do
  movie = Movie.create!(title: Faker::Movie.unique.title)
  puts "created movie: #{movie.title} #{'*' * 10}"
end


## Lists
default_list_names = [
  'Action', 'Comedy', 'Documentaries', 'Indie', 'Foreign', 'Horror', 'Holidays',
  'SciFi', '80s', 'Old Standbys'
]
default_list_names.each do |name|
  list = List.create!(name: name, owner: mike)
  puts "list created for mike: #{list.name} #{'*' * 10}"
end
owner_ids = User.where.not(id: mike.id).pluck(:id)
10.times do
  list = List.create!(name: default_list_names.sample, owner_id: owner_ids.shift)
  puts "list created for #{list.owner.first_name}: #{list.name} #{'*' * 10}"
end

## Listings
# Ensure some movies are on no lists, and others are on multiple across users
movie_ids = Movie.all.pluck(:id).sample(80)
mike_movie_ids = movie_ids.dup
mike_lists = List.where(owner: mike).to_a

mike_movie_ids.shift(rand(3..10)).each do |movie_id|
  mike_lists.sample(rand(1..3)).each do |list|
    listing = Listing.create!(movie_id: movie_id, list: list, creator: mike)
    puts "listing created. movie_id: #{listing.movie_id}, list_id: #{listing.list_id} #{'*' * 10}"
  end
end

non_mike_lists = List.where.not(owner: mike).to_a
movie_ids.shift(rand(3..10)).each do |movie_id|
  non_mike_lists.sample(3).uniq.each do |list|
    listing = Listing.create!(movie_id: movie_id, list: list, creator: list.owner)
    puts "listing created. movie_id: #{listing.movie_id}, list_id: #{listing.list_id} #{'*' * 10}"
  end
end

## Memberships
List.where(owner: mike).each do |list|
  list.update(members: User.where.not(id: mike).sample(3).uniq)

  puts "list #{list.name} has member_ids: #{list.member_ids} #{'*' * 10}"
end
