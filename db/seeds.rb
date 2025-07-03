# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# Clear existing data
puts "Clearing existing data..."
User.destroy_all
Post.destroy_all
Comment.destroy_all
Like.destroy_all

# Create sample users
puts "Creating sample users..."
user1 = User.create!(
  email: "alice@example.com",
  password: "password123",
  password_confirmation: "password123"
)

user2 = User.create!(
  email: "bob@example.com", 
  password: "password123",
  password_confirmation: "password123"
)

user3 = User.create!(
  email: "charlie@example.com",
  password: "password123", 
  password_confirmation: "password123"
)

# Create sample posts
puts "Creating sample posts..."
post1 = Post.create!(
  title: "Getting Started with Hotwire in Rails 7",
  body: "Hotwire is an amazing addition to Rails 7 that makes building dynamic, real-time applications incredibly simple. In this post, I'll walk you through the basics of Turbo Drive, Turbo Frames, and Turbo Streams. We'll build a live commenting system that updates in real-time without any custom JavaScript!",
  user: user1
)

post2 = Post.create!(
  title: "Why Tailwind CSS is Perfect for Rails Developers",
  body: "Tailwind CSS has revolutionized how I build user interfaces. The utility-first approach combined with Rails' component-based architecture creates a powerful development experience. Let me share some tips and tricks I've learned along the way.",
  user: user2
)

# Create sample comments
puts "Creating sample comments..."
comment1 = Comment.create!(
  body: "This is exactly what I needed! The Hotwire approach is so much cleaner than writing custom JavaScript. Can't wait to try this out in my next project.",
  user: user2,
  post: post1
)

comment2 = Comment.create!(
  body: "Great tutorial! I especially love how Turbo Streams make real-time updates so simple. No more complex WebSocket setup.",
  user: user3,
  post: post1
)

comment3 = Comment.create!(
  body: "I've been using Tailwind for a while now and it's completely changed my workflow. The design system is so consistent!",
  user: user1,
  post: post2
)

# Create nested replies
puts "Creating nested replies..."
reply1 = Comment.create!(
  body: "Totally agree! The utility classes make prototyping so much faster.",
  user: user3,
  post: post2,
  parent: comment3
)

reply2 = Comment.create!(
  body: "Have you tried the new Tailwind v4 features? The performance improvements are incredible!",
  user: user2,
  post: post2,
  parent: comment3
)

# Create likes
puts "Creating sample likes..."
Like.create!(user: user2, comment: comment1)
Like.create!(user: user3, comment: comment1)
Like.create!(user: user1, comment: comment2)
Like.create!(user: user2, comment: comment3)
Like.create!(user: user3, comment: reply1)

puts "Sample data created successfully!"
puts "Users: #{User.count}"
puts "Posts: #{Post.count}"
puts "Comments: #{Comment.count}"
puts "Likes: #{Like.count}"
puts ""
puts "You can now visit http://localhost:3000 to see the beautiful comment system!"
puts "Login with any of these accounts:"
puts "- alice@example.com / password123"
puts "- bob@example.com / password123" 
puts "- charlie@example.com / password123"
