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

halo_title = ["Curiosity surrounding Master Chief's appearance", "I'm VERY interested in Cortana", "Flood fanboys gather here", "In need of interstellar directions", "Looking for an alien gun mechanic"]


zelda_questions = ["Who actually plays the ocarina?", "Does anyone have any paintings of Ganondorf for sale?", "How do I beat the water temple?", "Are there any cheat codes for Wind Waker?", "Which Zelda game is the highest rated?"]

zelda_title = ["Looking for obscure instrument experts", "In search of rare Zelda art", "Help! I'm stuck in OOT", "In search of a Wind Waker boss", "Strongly opinionated Zelda fans gather here"]

pokemon_questions = ["What is Ash's favorite color?", "How many Pokeballs can Brock carry at one time?", "Where can I find Mewtwo?", "Does anyone know how to change the color of my Pokeballs?", "In which Brooklyn neighborhood can I find Psyduck?"]

pokemon_title = ["Anyone know Ash personally? I've got a question", "Does anyone work out with Brock? Does he even lift?", "In search of extremely rare Pokemon", "Pokeball experts, you are my last hope!", "Brooklynites, I've got a VERY important question for you."]

all_users[0..4].each_with_index do |u, i|
  u.questions << Question.create(title: halo_title[i], question_body: halo_questions[i])
end

all_users[5..9].each_with_index do |u, i|
  u.questions << Question.create(title: zelda_title[i], question_body: zelda_questions[i])
end

all_users[10..14].each_with_index do |u, i|
  u.questions << Question.create(title: pokemon_title[i], question_body: pokemon_questions[i])
end
