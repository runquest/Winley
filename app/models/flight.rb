class Flight < ActiveRecord::Base
	belongs_to :event, inverse_of: :flights
	belongs_to :bottle

end
