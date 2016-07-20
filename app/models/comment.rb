class Comment < ActiveRecord::Base
  # Remember to create a migration!
  validates :comment_body, length: {minimum: 8}
  belongs_to :user
  belongs_to :commentable, polymorphic: true
end
