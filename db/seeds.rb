User.delete_all
Question.delete_all
Answer.delete_all
Vote.delete_all
Comment.delete_all

all_users = 15.times.map do
  User.create!(  username: Faker::Internet.user_name,
                 password_digest: Faker::Internet.password(9),
                 email: Faker::Internet.email
                 )
end

