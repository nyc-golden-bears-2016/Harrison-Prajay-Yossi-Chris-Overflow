class User < ActiveRecord::Base
  has_secure_password

  validates :username, {length: {minimum: 6}, uniqueness: true}
  validates :email, {uniqueness: true}
  validates :password, length: {minimum: 8}
end
