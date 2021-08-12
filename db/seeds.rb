# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

if Movie.count < 20
  20.times do
    movie = Movie.create!(title: Faker::Movie.title)
    puts "created movie: #{movie.title} #{'*' * 10}"
  end
else
  puts 'There are already movies in the database'
end
