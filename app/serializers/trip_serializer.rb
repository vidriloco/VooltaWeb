class TripSerializer < ActiveModel::Serializer
  attributes :id, :title, :details, :distance, :complexity, :cost, :available, :start, :final, :trip_resource, :updated_at
  has_one :main_image
  has_one :background_image
  has_many :paths
  has_many :contents
  has_many :pois
  
  def trip_resource
    object.trip_resource.identifier
  end
  
  def pois
      object.pois.where(published: true)
  end
  
  def start
    return { lat: 0, lon: 0 } if object.origin_coordinate.nil?
    { lat: object.origin_coordinate.lat, lon: object.origin_coordinate.lon }
  end
  
  def final
    return { lat: 0, lon: 0 } if object.end_coordinate.nil?
    { lat: object.end_coordinate.lat, lon: object.end_coordinate.lon }
  end
  
end
