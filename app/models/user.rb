  class User < ActiveRecord::Base
  has_many :attendances
  has_many :events, :through => :attendances
  has_many :bottles, :through => :reviews

    
  has_secure_password

  validates :email,
    presence: true

  validates :fname,
    presence: true

  validates :lname,
    presence: true

  validates :password,
    length: { in: 6..20 }, on: :create

  def full_name
    "#{fname} #{lname}"
  end
    

end


