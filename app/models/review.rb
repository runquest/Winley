class Review < ActiveRecord::Base

  belongs_to :user, inverse_of: :reviews
  validates :user, presence: true

  belongs_to :bottle, inverse_of: :reviews
  validates :bottle, presence: true

  validates :my_rating, presence: true
  validates :my_rating, numericality: {only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 5}

end
