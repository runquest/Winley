class Event < ActiveRecord::Base

  validates :title, presence: true

  validates :venue, presence: true

  validates :date, presence: true

  validates :duration, presence: true

  has_many :attendances, inverse_of: :event, dependent: :destroy

  has_many :flights, inverse_of: :event, dependent: :destroy

  belongs_to :user, inverse_of: :events

end
