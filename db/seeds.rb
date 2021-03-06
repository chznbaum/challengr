# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Users
['challenger', 'creator', 'banned', 'moderator', 'admin'].each do |role|
  Role.find_or_create_by({ name: role })
end

puts "#{Role.count} roles created."

User.create!(name: "Example User",
             username: "example_user",
             email: "example@challengr.com",
             password: "passwordpassword",)

User.create!(name: "Creator User",
             username: "creator_user",
             email: "creator@challengr.com",
             password: "passwordpassword")

User.create!(name: "Banned User",
             username: "banned_user",
             email: "banned@challengr.com",
             password: "passwordpassword")

User.create!(name: "Moderator User",
             username: "moderator_user",
             email: "moderator@challengr.com",
             password: "passwordpassword")

User.create!(name: "Admin User",
             username: "admin_user",
             email: "admin@challengr.com",
             password: "passwordpassword")

95.times do |user|
  name = Faker::Name.name
  username = Faker::Internet.user_name(name, %w(. _ -))
  email = "example-#{user+1}@challengr.com"
  password = "passwordpassword"
  User.create!(name: name,
               username: username,
               email: email,
               password: password)
end

puts "#{User.count} users created."

# Role Assignments
User.all.each do |user|
  Assignment.create!(
    user_id: user.id,
    role_id: 1
  )
end

roles = [2, 4, 5]
roles.each do |role|
  Assignment.create!(
    user_id: 1,
    role_id: role
  )
  Assignment.create!(
    user_id: role,
    role_id: role
  )
end

Assignment.create!(
  user_id: 3,
  role_id: 3
)

puts "#{Assignment.count} role assignments created."

# Following relationships
users = User.all
user = users.first
following = users[2..50]
followers = users[3..40]
following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }

puts "#{Relationship.count} relationships created."

# Topics
6.times do |topic|
  Topic.create!(
    title: Faker::Lorem.words(2).join(" ").titleize
  )
end

puts "#{Topic.count} topics created."

# Blogs
users.each do |user|
  3.times do |blog|
    Blog.create!(
      title: Faker::Lorem.words(7).join(" ").titleize,
      body: Faker::Lorem.paragraphs(3).join("\n\n"),
      user_id: user.id,
      topic_id: rand(1..6)
      )
  end
end

puts "#{Blog.count} blog posts created."

# Challenges
6.times do |challenge|
  Challenge.create!(
    name: Faker::Lorem.words(3).join(" ").titleize,
    description: Faker::Lorem.paragraphs(2).join("\n\n"),
    main_image: "http://placehold.it/600x400",
    thumb_image: "http://placehold.it/350x200",
    official_link: "http://example.com",
    register_link: "http://example.com"
  )
end

puts "#{Challenge.count} challenges created."

# Projects
users.each do |user|
  9.times do |project|
    Project.create!(
      title: Faker::Lorem.words(3).join(" ").titleize,
      subtitle: Faker::Lorem.words(5).join(" ").titleize,
      description: Faker::Lorem.paragraph(3, false, 3),
      main_image: "http://placehold.it/600x400",
      thumb_image: "http://placehold.it/350x200",
      source_link: "http://github.com",
      view_link: "http://example.com",
      user_id: user.id
    )
  end
end

puts "#{Project.count} projects created."