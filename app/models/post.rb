class Post < ApplicationRecord
  belongs_to :school
  belongs_to :user
  has_many :likes
  has_many :flags

  validates :content, length: { minimum: 3, maximum: 150 }, presence: true, allow_blank: false
# inclusion: { in: %w(SO ASO shout-out anti-shoutout), message: "You must use either 'SO', 'ASO', 'shout-out', or 'anti-shoutout' somewhere in your post"},
  validate :is_post_SO_or_ASO_or_both


  def is_post_SO_or_ASO_or_both
    if content.include?("SO" || "shout-out")
      is_shoutout = true
    elsif content.include?("ASO" || "anti-shoutout")
      is_antishoutout = true
    elsif content.include?("SO" || "shout-out" && "ASO" || "anti-shoutout")
      is_shoutout = true
      is_antishoutout = true
    else
      errors.add(:content, "You must use either 'SO', 'ASO', 'shout-out', or 'anti-shoutout' somewhere in your post")
    end
  end

end
