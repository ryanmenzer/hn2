require 'faker'

5.times do
  User.create(username: Faker::Internet.user_name,
              email: Faker::Internet.email,
              password: Faker::Internet.password,
              name: Faker::Name.name,
              about: Faker::Lorem.paragraph(sentence_count = 1, supplemental = false, random_sentences_to_add = 2))
end

User.all.each do |user|
  3.times do
    Post.create(title: Faker::Lorem.sentence, 
                body: Faker::Lorem.paragraph(sentence_count = 3, supplemental = false, random_sentences_to_add = 7),
                user_id: user.id)
  end
end

Post.all.each do |post|
  rand(1..5).times do
    user_num = rand(1..(User.all.count))
    Comment.create(body: Faker::Lorem.paragraph(sentence_count = 1, supplemental = false, random_sentences_to_add = 2),
                  post_id: post.id,
                  user_id: user_num)
  end
end
