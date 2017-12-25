User.destroy_all
Forum.destroy_all
ForumMessage.destroy_all

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
              detail: Faker::Dune.quote,
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
              detail: Faker::Dune.quote,
              avatar: URI.parse(Faker::Avatar.image))
end

30.times do |i|
  user = User.find(rand(User.first.id..User.last.id))
  Forum.create!(title: Faker::Book.title,
                description: Faker::Hipster.sentence,
                user_id: user.id
  )
end

100.times do |i|
  board = Forum.find(rand(Forum.first.id..Forum.last.id))
  user = User.find(rand(User.first.id..User.last.id))
  ForumMessage.create!(user_id: user.id,
                       forum_id: board.id,
                       title: Faker::Simpsons.location,
                       body: Faker::RickAndMorty.quote
  )
end


p "Created #{User.count} users!"
p "Created #{Forum.count} forums!"
p "Created #{ForumMessage.count} forum messages!"
