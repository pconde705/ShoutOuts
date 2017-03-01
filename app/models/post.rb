class Post < ApplicationRecord

  before_validation :define_SO_ASO

  belongs_to :school
  belongs_to :user
  has_many :likes
  has_many :flags

  validates :content, length: { minimum: 3, maximum: 150 }, presence: true, allow_blank: false
  validate :is_post_SO_or_ASO_or_both


  def define_SO_ASO
    if content.include?("SO" || "shout-out")
      self.is_shoutout = true
    elsif content.include?("ASO" || "anti-shoutout")
      self.is_antishoutout = true
    elsif content.include?("SO" || "shout-out" && "ASO" || "anti-shoutout")
      self.is_shoutout = true
      self.is_antishoutout = true
    end
  end


  def is_post_SO_or_ASO_or_both
    return if is_shoutout || is_antishoutout
    errors.add(:content, "You must use either 'SO', 'ASO', 'shout-out', or 'anti-shoutout' somewhere in your post")
  end

end
