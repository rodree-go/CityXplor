# db/seeds.rb

require 'faker'

# Borrar datos previos
Review.destroy_all
Booking.destroy_all
Experience.destroy_all
User.destroy_all

# Crear usuarios
users = [
  { email: 'tulum_host@example.com', password: '123456' },
  { email: 'california_host@example.com', password: '123456' },
  { email: 'roraima_host@example.com', password: '123456' },
  { email: 'guest1@example.com', password: '123456' },
  { email: 'guest2@example.com', password: '123456' }
].map { |u| User.create!(u) }

# Crear experiencias
experiences_data = [
  {
    category: 'Nature',
    title: 'Sunrise paddleboard & meditation',
    location: 'Tulum',
    description: 'Start your day gliding over turquoise waters and end with a grounding meditation on the shore.',
    rating: 4.9,
    price: 45.0,
    seats: 6,
    host: users[0],
    start_time: Date.today,
    end_time: Date.today
  },
  {
    category: 'Culture',
    title: 'Explore Mayan ruins with a local guide',
    location: 'Tulum',
    description: 'Dive deep into Mayan history at Coba and Tulum ruins with a certified guide.',
    rating: 4.8,
    price: 65.0,
    seats: 8,
    host: users[0],
    start_time: Date.today,
    end_time: Date.today
  },
  {
    category: 'Food & Drink',
    title: 'Mexican cooking class with cenote swim',
    location: 'Tulum',
    description: 'Learn to cook regional dishes, then relax in a nearby freshwater cenote.',
    rating: 4.7,
    price: 70.0,
    seats: 10,
    host: users[0],
    start_time: Date.today,
    end_time: Date.today
  },
  {
    category: 'Adventure',
    title: 'Surfing the California coast',
    location: 'California',
    description: 'Catch waves with a pro on Malibu beach and enjoy fresh smoothies after.',
    rating: 4.6,
    price: 85.0,
    seats: 5,
    host: users[1],
    start_time: Date.today,
    end_time: Date.today
  },
  {
    category: 'Nature',
    title: 'Yosemite National Park day hike',
    location: 'California',
    description: 'A guided trail through waterfalls and granite cliffs in Yosemite.',
    rating: 4.9,
    price: 90.0,
    seats: 12,
    host: users[1],
    start_time: Date.today,
    end_time: Date.today
  },
  {
    category: 'Art & Design',
    title: 'Graffiti tour and street art workshop',
    location: 'California',
    description: 'Discover LA’s street art culture and create your own masterpiece.',
    rating: 4.5,
    price: 55.0,
    seats: 15,
    host: users[1],
    start_time: Date.today,
    end_time: Date.today
  },
  {
    category: 'Adventure',
    title: 'Mount Roraima base hike',
    location: 'Roraima, Venezuela',
    description: 'Multi-day experience hiking to the legendary table-top mountain.',
    rating: 4.8,
    price: 150.0,
    seats: 4,
    host: users[2],
    start_time: Date.today,
    end_time: Date.today
  },
  {
    category: 'Nature',
    title: 'Canoe ride in Canaima lagoon',
    location: 'Roraima, Venezuela',
    description: 'Explore the magical lagoon and its pink-hued skies by canoe.',
    rating: 4.7,
    price: 60.0,
    seats: 6,
    host: users[2],
    start_time: Date.today,
    end_time: Date.today
  },
  {
    category: 'Culture',
    title: 'Meet the Pemon community',
    location: 'Roraima, Venezuela',
    description: 'Visit a local indigenous village and learn about their traditions and crafts.',
    rating: 4.9,
    price: 40.0,
    seats: 10,
    host: users[2],
    start_time: Date.today,
    end_time: Date.today
  }
]


experiences = experiences_data.map do |exp|
  Experience.create!(
    category: exp[:category],
    title: exp[:title],
    location: exp[:location],
    description: exp[:description],
    rating: exp[:rating],
    price: exp[:price],
    seats: exp[:seats],
    user_id: exp[:host].id,
    start_time: exp[:start_time],
    end_time: exp[:end_time]
  )
end

# Crear bookings
bookings = []
5.times do
  bookings << Booking.create!(
    user_id: users.sample.id,
    experience_id: experiences.sample.id,
  )
end

# Crear reviews
10.times do
  Review.create!(
    content: Faker::Quote.famous_last_words,
    rating: rand(4.0..5.0).round(1),
    experience_id: experiences.sample.id,
    user_id: users[3..4].sample.id
  )
end

puts "✅ Seeded #{users.count} users, #{experiences.count} experiences, #{bookings.count} bookings, and 10 reviews."
