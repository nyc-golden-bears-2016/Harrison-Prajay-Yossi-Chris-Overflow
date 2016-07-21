class Tag < ActiveRecord::Base
  validates :tag_name, uniqueness: true, length: {maximum: 20}
  has_many :question_tags
  has_many :questions, through: :question_tags
end
