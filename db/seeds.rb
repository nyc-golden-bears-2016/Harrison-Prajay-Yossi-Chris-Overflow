User.delete_all
Question.delete_all
Answer.delete_all
Vote.delete_all
Comment.delete_all

all_users = 15.times.map do
  User.create!(  username: Faker::Internet.user_name(7),
                 password_digest: Faker::Internet.password(9),
                 email: Faker::Internet.email
                 )
end

halo_questions = ["What does the master chief actually look like?", "Is Cortana single?", "How do I join the flood?", "Where is the third ring?", "Is anyone having trouble with their needler?"]

zelda_questions = ["Who actually plays the ocarina?", "Does anyone have any paintings of Ganondorf for sale?", "How do I beat the water temple?", "Are there any cheat codes for Wind Waker?", "Which Zelda game is the highest rated?"]

pokemon_questions = ["What is Ash's favorite color?", "How many Pokeballs can Brock carry at one time?", "Where can I find Mewtwo?", "Does anyone know how to change the color of my Pokeballs?", "In which Brooklyn neighborhood can I find Psyduck?"]

all_users[0..4].each_with_index do |u, i|
  u.questions << Question.create(title: "Halo", question_body: halo_questions[i])
end

all_users[5..9].each_with_index do |u, i|
  u.questions << Question.create(title: "Zelda", question_body: zelda_questions[i])
end

all_users[10..14].each_with_index do |u, i|
  u.questions << Question.create(title: "Pokemon", question_body: pokemon_questions[i])
end
