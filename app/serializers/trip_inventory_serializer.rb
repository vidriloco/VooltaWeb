class TripInventorySerializer < ActiveModel::Serializer  
  attributes :id, :checksum, :lang, :trip_resource
  
  def trip_resource
    object.trip_resource.identifier
  end
end
