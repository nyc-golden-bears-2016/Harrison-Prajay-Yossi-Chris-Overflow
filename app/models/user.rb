class User < ActiveRecord::Base
  has_secure_password

  validates :username, {length: {minimum: 6}, uniqueness: true}
  validates :email, {uniqueness: true}
  validates :password_digest, length: {minimum: 8}
  has_many :questions
  has_many :answers
  has_many :comments
end
