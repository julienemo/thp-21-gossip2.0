# depending tables need to be destroyed BEFORE depended tables
# join tables always destroyed before tables to which they belong
Biscomment.destroy_all
Comment.destroy_all
JoinTableMessageRecipient.destroy_all
JoinTableGossipTag.destroy_all
Message.destroy_all
Tag.destroy_all
Gossip.destroy_all
User.destroy_all
City.destroy_all
puts "Previous records cleared."

10.times do
  City.create!(name: Faker::Address.city, zip_code:Faker::Address.zip_code)
end
puts "10 fakes cities generated."


50.times do
  User.create!(email: Faker::Internet.email,
  description: ["", "A guy who codes", "The tiger in me sniffs rose"].sample,
  last_name: Faker::Name.last_name,
  age: rand(15..100),
  first_name: Faker::Name.first_name,
  city_id: City.all.sample.id,
  password: Faker::Code.nric(27, 34))
end
puts "50 fake user profiles generated."

users = User.all.map{|u| u.id}
users.each do |u|
  10.times do
    Gossip.create(user_id: u,
    content: Faker::Lorem.sentence,
    title: Faker::Book.title)
  end
end
puts "#{Gossip.all.length} fake gossips generated."


10.times do
  Tag.create(title: Faker::Book.title, color:Faker::Color.color_name)
end
puts "#{Tag.all.length} fake tags generated"

gossips = Gossip.all.map{|g| g.id}
gossips.each do |g|
  3.times do
    JoinTableGossipTag.create(gossip_id: g, tag_id: Tag.all.sample.id)
  end
end
puts "5 fake association gossip-tag generated per gossip"


users.each do |u|
  5.times do
    Message.create!(sender_id: u,
    content: Faker::Lorem.sentence)
  end
end
puts "5 fake messages generated from per user."

messages = Message.all.map{|m| m.id}
messages.each do |m|
  3.times do
    JoinTableMessageRecipient.create!(
    message_id: m,
    recipient_id: users.sample,
    content: Faker::Lorem.sentence
    )
  end
end
puts "3 fake recipients generated per message"

gossips.each do |g|
  n = rand(1..5)
  n.times do
    Comment.create(gossip_id: g, author_id: users.sample, content: Faker::Quotes::Shakespeare.hamlet_quote)
  end
end
puts "#{Comment.all.length} comments generated"

comments = Comment.all.map{|c| c.id}
comments.each do |c|
  n = rand(1..5)
  n.times do
    Biscomment.create(comment_id: c, author_id: users.sample, content: Faker::Quotes::Shakespeare.as_you_like_it_quote)
  end
end
puts "#{Biscomment.all.length} comments on comments (biscomments) generated"
