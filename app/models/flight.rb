class Flight < ActiveRecord::Base
	belongs_to :event
	belongs_to :bottle

end
