class Winery < ActiveRecord::Base

  validates :name, uniqueness: { case_sensitive: false }
  validates :name, presence: true

  belongs_to :region, inverse_of: :wineries
  validates :region, presence: true

  has_many :bottles, inverse_of: :winery

  has_many :reviews, through: :bottles

  has_many :flights, through: :bottles

end
