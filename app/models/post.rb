class Post < ApplicationRecord
  include PgSearch
  pg_search_scope :search_by_content, against: [ :id, :content ]


  before_validation :define_SO_ASO

  belongs_to :school
  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :flags, dependent: :destroy

  validates :content, length: { minimum: 3, maximum: 150 }, presence: true, allow_blank: false
  validate :is_post_SO_or_ASO_or_both


  def define_SO_ASO
    if content.match(/^ASO|(ASO)/)
      self.is_antishoutout = true
    elsif content.match(/^SO|[^A](SO)/)
      self.is_shoutout = true
    end
  end


  def is_post_SO_or_ASO_or_both
    return if self.is_shoutout || self.is_antishoutout
    errors.add(:content, "You must use either 'SO' or 'ASO' somewhere in your post")
  end

  def number_of_likes
    likes.count
  end

  def flagged?
    flags.present?
  end


end
