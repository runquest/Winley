class Event < ActiveRecord::Base
    has_many :attendances
	has_many :users, :through => :attendances
    has_many :bottles, :through => :flights
    has_many :flights

    accepts_nested_attributes_for :bottles, :allow_destroy => true


    validates :title, 
    presence: true

    validates :venue,
    presence: true

    validates :date,
    presence: true

    validates :duration, numericality: { only_integer: true }
    
    validates :description,
    presence: true

end