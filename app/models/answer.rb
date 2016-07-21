class Answer < ActiveRecord::Base
  # Remember to create a migration!
  validates :answer_body, length: {minimum: 30}
  has_many :votes, as: :votable
  belongs_to :user
  has_many :comments, as: :commentable
  belongs_to :question
end
