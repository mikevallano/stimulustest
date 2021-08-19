
# run with `rails db:seed:replant` to avoid recreating the db

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
movie_ids = Movie.all.pluck(:id)
List.all.each do |list|
  owner_id = list.owner_id
  list_id = list.id
  movie_ids.shift(5).each do |movie_id|
    Listing.create!(movie_id: movie_id, list_id: list_id, creator_id: owner_id)
  end
  puts "list (#{list.name}) movie_ids: #{list.movie_ids} #{'*' * 10}"
end

## Memberships
List.where(owner: mike).each do |list|
  list.update(members: User.where.not(id: mike).sample(3).uniq)

  puts "list #{list.name} has member_ids: #{list.member_ids} #{'*' * 10}"
end
