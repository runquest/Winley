class Attendance < ActiveRecord::Base

  belongs_to :user, inverse_of: :attendances
  validates :user, presence: true

  belongs_to :event, inverse_of: :attendances
  validates :event, presence: true

end
