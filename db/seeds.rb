require 'faker'


10.times do
  User.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    description: Faker::Lorem.paragraph(sentence_count: 3),
    email: Faker::Internet.email,
    age: rand(18..70)
  )
end


10.times do
  City.create(
    name: Faker::Address.unique.city,
    zip_code: Faker::Address.zip_code
  )
end
User.all.each do |user|
 city = City.all.sample
 user.update(city_id: city.id)
end


8.times do
  user = User.all.sample
  gossip = user.gossips.create(
    title: Faker::Movies::StarWars.quote 
  )
  puts "Gossip créé : #{gossip.title} par #{user.first_name} #{user.last_name}"
end

