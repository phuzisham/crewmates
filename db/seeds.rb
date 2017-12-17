User.destroy_all

#seeding products
20.times do
  User.create!(name: Faker::Simpsons.unique.character,
              age: Faker::Number.between(18, 80),
              experience: Faker::Number.between(5, 20),
              home: Faker::ElderScrolls.region,
              username: Faker::Internet.unique.user_name(5..8),
              email: Faker::Internet.unique.email,
              password: Faker::Internet.password(6),
              account_type: 'Captain',
              available: 'Available',
              avatar: URI.parse(Faker::Avatar.image))
end

20.times do
  User.create!(name: Faker::Simpsons.unique.character,
              age: Faker::Number.between(18, 80),
              experience: Faker::Number.between(5, 20),
              home: Faker::ElderScrolls.region,
              username: Faker::Internet.unique.user_name(5..8),
              email: Faker::Internet.unique.email,
              password: Faker::Internet.password(6),
              account_type: 'Crew',
              available: 'Available',
              avatar: URI.parse(Faker::Avatar.image))
end

p "Created #{User.count} members!"
