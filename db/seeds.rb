# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
3.times do |i|
  Portfolio.create(title: "Work #{i}", subtitle: 'This is awesome', body: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                   main_image: 'https://via.placeholder.com/400x600', thumb_image: 'https://via.placeholder.com/200x200')
end

Skill.create(title: 'Rails', percent_utilized: 100)

user = User.create(email: 'bob@email.com', password: '123456')

1000.times do |_i|
  blog = Blog.create(title: Faker::Quote.famous_last_words, user: user, status: Faker::Number.between(from: 0, to: 1))
  3.times do |_i|
    blog.comments.create(name: 'Bob')
  end
end

puts Blog.count
puts 'Seeding complete'
