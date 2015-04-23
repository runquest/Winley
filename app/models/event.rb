class Event < ActiveRecord::Base
    has_many :attendances
	has_many :users, :through => :attendances
	has_many :bottles, :through => :flights

    validates :title, 
    presence: true

    validates :venue,
    presence: true

    validates :date,
    presence: true

    # validates :duration,
    # presence: true 
    
    validates :description,
    presence: true

end
