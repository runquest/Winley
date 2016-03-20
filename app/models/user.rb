class User < ActiveRecord::Base

  has_secure_password

  validates :email, uniqueness: { case_sensitive: false }
  validates :email, presence: true

  validates :fname, presence: true

  validates :lname, presence: true

  validates :password_digest, length: { in: 6..100 }, on: :create
  validates :password_digest, presence: true

  has_many :events, inverse_of: :user
  has_many :reviews
  has_many :reviews, inverse_of: :user, dependent: :destroy
  has_many :bottles, through: :reviews
  has_many :flights, through: :events
  has_many :attendances, inverse_of: :user, dependent: :destroy

  def full_name
    "#{fname} #{lname}"
  end
end
