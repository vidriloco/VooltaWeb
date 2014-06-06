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
  
  validates :poi_kind, :title, :details, :trip, :mode, :lat, :lon, presence: true
  
  validates :image, presence: true, :unless => Proc.new { |poi| poi.is_small? }
  
  rails_admin do         
    edit do
      include_all_fields
      exclude_fields :created_at, :updated_at, :checksum
            
      field :lat
      field :lon
    end
    
    list do
      field :id
      field :title
      field :trip_name
      field :listed
      field :sponsored
    end
  end
  
  def trip_name
    trip.full_name
  end
  
  def is_small?
    self.mode == "small"
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
  
  def image_if_mode_is_not_small
    
  end
  
  def update_coordinates
    self.coordinates = "POINT(#{self.lon.to_f} #{self.lat.to_f})"
  end
  

end
