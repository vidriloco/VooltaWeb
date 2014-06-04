class Path < ActiveRecord::Base
  has_and_belongs_to_many :trips
  
  after_save :update_trip_checksum
  
  protected 
  def update_trip_checksum
    trips.each do |trip|
      trip.update_checksum && trip.save
    end
  end
end
