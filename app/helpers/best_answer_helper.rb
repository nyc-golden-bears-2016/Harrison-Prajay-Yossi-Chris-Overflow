def set_best_answer(answer)
  answer.question.answers.each do |other_answer|
    other_answer.best_answer = false
    other_answer.save
  end
  answer.best_answer = true
  answer.save
end

def get_best_answer(question)
  question.answers.each do |answer|
    if answer.best_answer == true
      return answer
    end
  end
  nil
end

# def has_best_answer?(question)
#   question.answers.each do |answer|
#     if answer.best_answer == true
#       return true
#     end
#   end
#   false
# end
