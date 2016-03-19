class Flight < ActiveRecord::Base

  belongs_to :bottle, inverse_of: :flights
  validates :bottle, presence: true

  belongs_to :event, inverse_of: :flights
  validates :event, presence: true

end
