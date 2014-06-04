class TripResource < ActiveRecord::Base
  has_many :trips
  
  validates :identifier, presence: true
  
  def full_name
    identifier
  end
end
