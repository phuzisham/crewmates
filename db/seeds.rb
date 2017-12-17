User.destroy_all

#seeding products
20.times do
  User.create!(name: Faker::Simpsons.unique.character,
              age: Faker::Number.between(18, 80),
              experience: Faker::Number.between(5, 20),
              home: Faker::ElderScrolls.region,
              username: Faker::Zelda.unique.character,
              email: Faker::Internet.unique.email,
              password: Faker::Internet.password(6),
              avatar: URI.parse(Faker::Avatar.image))
end

p "Created #{User.count} users"
