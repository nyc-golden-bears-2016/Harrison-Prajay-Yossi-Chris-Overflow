def count_votes(post)
  post.votes.to_a.inject(0) { |sum,vote| sum += vote.value }
end
