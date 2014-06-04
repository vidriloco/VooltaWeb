class Slide < ActiveRecord::Base
  belongs_to :poi
  belongs_to :image
  
  after_save      :update_trip_checksum
  after_destroy   :update_trip_checksum
    
  protected 
  def update_trip_checksum
    (poi.trip.update_checksum && poi.trip.save)
  end
end
