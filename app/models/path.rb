class Path < ActiveRecord::Base
  has_and_belongs_to_many :trips, class_name: "Trip", join_table: :path_trips
  
  after_save :update_trip_checksum
  
  before_save :transform_coordinates
  
  #before_destroy { PathTrip.where(path_id: id).destroy_all }
  scope :staged_trip, -> { joins(:trips).distinct('path_trips.trip_id').where('trips.staging = TRUE') }
  
  rails_admin do         
    list do
      scopes [:staged_trip]
      field :id
      field :name
      field :listed_on_trips
      field :trip_name
    end
  end
  
  def listed_on_trips
    return nil if trips.empty? 
    trip_list = String.new
    trips.each do |trip|
      trip_list << "#{trip.full_name}, "
    end
    trip_list.chop.chop
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
  
  def transform_coordinates
    if self.coordinates_vector[0] == "R"
      self.coordinates_vector = self.coordinates_vector.gsub(',0','|').gsub(',',' ').gsub('|', ' , ').chop.chop.chop.gsub("R ", '')
    end
  end
end
