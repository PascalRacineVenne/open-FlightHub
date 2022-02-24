# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
# 

puts "dropping database"
Airline.destroy_all
Review.destroy_all
puts "populating database"

airlines = Airline.create([
  { 
    name: "United Airlines",
    image_url: "https://open-flights.s3.amazonaws.com/United-Airlines.png"
  }, 
  { 
    name: "Southwest",
    image_url: "https://open-flights.s3.amazonaws.com/Southwest-Airlines.png"
  },
  { 
    name: "Delta",
    image_url: "https://open-flights.s3.amazonaws.com/Delta.png" 
  }, 
  { 
    name: "Alaska Airlines",
    image_url: "https://open-flights.s3.amazonaws.com/Alaska-Airlines.png" 
  }, 
  { 
    name: "JetBlue",
    image_url: "https://open-flights.s3.amazonaws.com/JetBlue.png" 
  }, 
  { 
    name: "American Airlines",
    image_url: "https://open-flights.s3.amazonaws.com/American-Airlines.png" 
  }
])

puts "#{airlines.length} airlines created"
reviews = Review.create([
  {
    title: 'Best company ever',
    description: 'I had so much leg room, life changing trip.',
    score: 4,
    airline: airlines.first
  },
  {
    title: 'Worst company ever',
    description: 'They lost all of our luggages, had to wait a week .',
    score: 1,
    airline: airlines.first
  },
  {
    title: 'Airline of the gods',
    description: 'The crew was so helpful and generous, my husband and I were experiencing difficulties with our new born and they really helped us.',
    score: 5,
    airline: airlines.first
  }
  ])
  puts "#{reviews.length} reviews created"

  puts 'done'