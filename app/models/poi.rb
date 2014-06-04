class Poi < ActiveRecord::Base
  belongs_to :poi_category
  belongs_to :poi_kind
  belongs_to :image
  belongs_to :trip
  has_many :contents, as: :contentable, :inverse_of => :contentable
  has_many :slides
  
  attr_accessor :lat, :lon
  before_validation :update_coordinates
  after_save :update_trip
  
  validates :poi_kind, :image, :title, :details, :trip, :mode, :lat, :lon, presence: true
  
  rails_admin do         
    edit do
      include_all_fields
      exclude_fields :created_at, :updated_at, :checksum
            
      field :lat
      field :lon
    end
  end
  
  def mode_enum
    ["slide_based", "small", "normal"]
  end
  
  def lat
    return @lat unless @lat.nil?
    coordinates.lat unless coordinates.nil?
  end
  
  def lon
    return @lon unless @lon.nil?
    coordinates.lon unless coordinates.nil?
  end
  
  def update_trip
    trip.update_checksum && trip.save
  end
  
  protected
  def update_coordinates
    self.coordinates = "POINT(#{self.lon.to_f} #{self.lat.to_f})"
  end
  

end
