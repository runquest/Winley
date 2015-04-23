class Event < ActiveRecord::Base
    has_many :attendances
	has_many :users, :through => :attendances
	has_many :bottles, :through => :flights

    validates :event_title, 
    presence: true

    validates :event_venue,
    presence: true

    validates :event_date,
    presence: true

    validates :duration,
    presence: true 
    
    validates :description,
    presence: true

end
