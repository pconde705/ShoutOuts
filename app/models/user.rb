class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :email, uniqueness: true, format: { with: /(@wisc.edu|@colum.edu)/, message: "You must enter a valid school email of your chosen school" }
  validates :school, presence: true

  validate :check_email_for_chosen_school

  has_many :posts
  has_many :likes
  belongs_to :school

  def check_email_for_chosen_school
    return if email.include?(school.email_domain_name)
    errors.add(:email, 'should correspond to the chosen school')
  end

end
