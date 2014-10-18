#encoding: utf-8
class Poi < ActiveRecord::Base
  has_and_belongs_to_many :trips, class_name: "Trip", join_table: :poi_trips
  
  belongs_to :poi_category
  belongs_to :poi_kind
  belongs_to :image
  has_many :contents, as: :contentable, :inverse_of => :contentable
  
  has_many :slides
  
  attr_accessor :lat, :lon
  before_validation :update_coordinates
  after_save :update_trips
  
  validates :poi_kind, :title, :mode, :lat, :lon, presence: true
  validates :details, presence: true, :if => Proc.new { |poi| poi.is_slide_based? }
  
  validates :image, presence: true, :unless => Proc.new { |poi| poi.is_small? }
  
  scope :staged_trip, -> { joins(:trips).distinct('poi_trips.trip_id').where('trips.staging = TRUE') }
  scope :staged_poi, -> { where(staging: true) }
  
  rails_admin do         
    edit do
      include_all_fields
      exclude_fields :created_at, :updated_at, :checksum
      field :lat
      field :lon
    end
    
    list do
      scopes [:staged_trip, :staged_poi, nil]
      field :id
      field :lang
      field :title
      field :listed_on_trips
      field :listed
      field :staging
    end
  end
  
  def listed_on_trips
    trip_list = String.new
    trips.each do |trip|
      trip_list << "#{trip.full_name}, "
    end
    trip_list.chop.chop
  end
  
  def lang
    return nil if trips.empty?
    trips.first.lang
  end
  
  def is_small?
    self.mode == "small"
  end
  
  def is_slide_based?
    self.mode == "slide_based"
  end
  
  def mode_enum
    Poi.modes.map { |element| element[1] }
  end
  
  def lat
    return @lat unless @lat.nil?
    coordinates.lat unless coordinates.nil?
  end
  
  def lon
    return @lon unless @lon.nil?
    coordinates.lon unless coordinates.nil?
  end
  
  def update_trips
    trips.each do |trip|
      trip.update_checksum && trip.save
    end
  end
  
  def self.modes
    [["A modo de slides (Requiere descripción)", "slide_based"], ["Pequeño", "small"], ["Normal", "normal"]]
  end
  
  protected
  
  def update_coordinates
    self.coordinates = "POINT(#{self.lon.to_f} #{self.lat.to_f})"
  end
  

end
