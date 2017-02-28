class Post < ApplicationRecord
  belongs_to :school
  belongs_to :user
  has_many :likes
  has_many :flags

  validates :content, length: { minimum: 3, maximum: 150 }, presence: true, allow_blank: false
end
