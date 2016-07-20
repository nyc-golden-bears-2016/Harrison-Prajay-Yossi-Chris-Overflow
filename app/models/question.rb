class Question < ActiveRecord::Base
  # Remember to create a migration!
  has_many :votes, as: :votable
  belongs_to :user
  has_many :answers
end
