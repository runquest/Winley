class Bottle < ActiveRecord::Base

  belongs_to :winery, inverse_of: :bottles
  validates :winery, presence: true

  validates :name, presence: true

  validates :grape, presence: true

  validates :vintage, presence: true

  has_many :reviews, inverse_of: :bottle, dependent: :destroy

  has_many :flights, inverse_of: :bottle, dependent: :destroy

end
