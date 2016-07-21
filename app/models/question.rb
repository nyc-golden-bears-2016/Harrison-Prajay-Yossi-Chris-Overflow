class Question < ActiveRecord::Base
  # Remember to create a migration!
  validates :question_body, length: {minimum: 30}
  validates :title, presence: true
  has_many :votes, as: :votable
  belongs_to :user
  has_many :answers
  has_many :comments, as: :commentable
  has_many :question_tags
  has_many :tags, through: :question_tags
end
