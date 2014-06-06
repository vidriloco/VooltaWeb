class Path < ActiveRecord::Base
  has_and_belongs_to_many :trips
  
  after_save :update_trip_checksum
  
  rails_admin do         
    list do
      field :id
      field :trip_name
    end
  end
  
  def trip_name
    return nil if trips.empty? 
    return nil if trips.first.trip_resource.nil?
    trips.first.trip_resource.identifier
  end
  
  protected 
  def update_trip_checksum
    trips.each do |trip|
      trip.update_checksum && trip.save
    end
  end
end
