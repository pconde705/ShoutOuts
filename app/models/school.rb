class School < ApplicationRecord
  has_many :users
  has_many :posts
  has_attachment :logo
end
