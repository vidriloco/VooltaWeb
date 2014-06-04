class PoiSerializer < ActiveModel::Serializer
  has_one :image
  has_many :contents
  has_many :slides
  
  protected
  def attributes
    { id: object.id,
      poi_category: poi_category, 
      poi_kind: poi_kind, 
      listed: object.listed, 
      sponsored: object.sponsored, 
      details: object.details, 
      title: object.title, 
      coordinates: coordinates,
      mode: object.mode }
  end
  
  def poi_category
    return {} if object.poi_category.nil? 
    {content: object.poi_category.content, keyword: object.poi_category.keyword, :filename => object.poi_category.image.filename }
  end
  
  def poi_kind
    {content: object.poi_kind.content, keyword: object.poi_kind.keyword, :filename => object.poi_kind.image.filename }
  end
  
  def coordinates
    return { lat: 0, lon: 0 } if object.coordinates.nil?
    { lat: object.coordinates.lat, lon: object.coordinates.lon }
  end
end
