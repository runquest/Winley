class Event < ActiveRecord::Base
	has_and_belongs_to_many :users
	has_and_belongs_to_many :bottles

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
