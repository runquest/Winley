class Flight < ActiveRecord::Base
	belongs_to :event, inverse_of: :flights
	belongs_to :bottle, inverse_of: :flights
  accepts_nested_attributes_for :bottle


end
