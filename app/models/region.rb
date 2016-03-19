class Region < ActiveRecord::Base

  # validates :name, uniqueness: true
  validates :name, uniqueness: { case_sensitive: false }

  validates :name, presence: true

  has_many :wineries, inverse_of: :region

  has_many :bottles, through: :wineries
end
