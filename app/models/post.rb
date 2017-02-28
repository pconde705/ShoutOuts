class Post < ApplicationRecord
  belongs_to :school
  belongs_to :user
  has_many :likes
  has_many :flags
end
