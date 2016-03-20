class Bottle < ActiveRecord::Base

  belongs_to :winery, inverse_of: :bottles

  validates :winery, presence: true

  validates :name, presence: true

  validates :grape, presence: true

  validates :vintage, presence: true

  has_many :reviews, inverse_of: :bottle, dependent: :destroy

  has_and_belongs_to_many :events

  def self.search(search)
    if search
        where(["name LIKE ?", "%#{search}%"])
    else
      all
    end
  end

end
