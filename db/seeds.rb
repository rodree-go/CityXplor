# db/seeds.rb
require "faker"

puts "Cleaning database..."
Review.destroy_all
Booking.destroy_all
Experience.destroy_all
User.destroy_all


puts "Creating users..."
users = 5.times.map do
  User.create!(
    email: Faker::Internet.unique.email,
    password: 123456
  )
end

puts "Creating experiences..."
categories = ["Adventure", "Food", "Wellness", "Culture", "Nature"]
experiences = 10.times.map do
  experience = Experience.create!(
    title: Faker::Job.title,
    description: Faker::Lorem.paragraph(sentence_count: 2),
    location: Faker::Address.city,
    price: rand(20..200),
    rating: rand(3.0..5.0).round(1),
    category: categories.sample,
    host: users.sample
  )
end
10.times do
    Review.create!(
      experience: experiences.sample,
      user: users.sample,
      content: Faker::Lorem.sentence(word_count: 10),
      rating: rand(3.0..5.0).round(1)
    )
  end

puts "Creating bookings..."
15.times do
  start_time = Faker::Time.forward(days: 30, period: :morning)
  end_time = start_time + rand(1..4).days

  Booking.create!(
    guest: users.sample,
    experience: experiences.sample,
    start_time: start_time,
    end_time: end_time
  )
end

puts "✅ Done seeding!"
