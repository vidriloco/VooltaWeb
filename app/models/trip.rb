#encoding: utf-8
class Trip < ActiveRecord::Base  
  has_and_belongs_to_many :paths, class_name: "Path", join_table: :path_trips
  has_and_belongs_to_many :pois, class_name: "Poi", join_table: :poi_trips
  
  has_many :contents, as: :contentable, :inverse_of => :contentable
  
  belongs_to :main_image, class_name: 'Image', foreign_key: 'main_image_id'
  belongs_to :background_image, class_name: 'Image', foreign_key: 'background_image_id'
  belongs_to :user
  belongs_to :trip_resource
  
  before_save :update_checksum
  before_validation :update_coordinates
  
  validates :trip_resource, presence: true
  
  validates :distance, :title, :details, :complexity, :background_image, :main_image, :origin_lat, :origin_lon, :final_lat, :final_lon, presence: true
  
  attr_accessor :origin_lat, :origin_lon, :final_lon, :final_lat
  
  rails_admin do         
    edit do
      include_all_fields
      exclude_fields :created_at, :updated_at, :checksum
            
      field :origin_lat
      field :origin_lon
      field :final_lat
      field :final_lon
    end
    
    list do
      field :lang
      field :full_name
      field :trip_resource
      field :available
      field :staging
      field :published_on_lite_version
    end
  end
  
  def self.find_all_with(publishing_mode)
    # Shows all trips: staging, the ones for the lite version and for the pro versions as well
    if(publishing_mode == :staging)
      all.order(updated_at: :desc).order(available: :desc)
    # Shows all trips on lite which are not staging
    elsif(publishing_mode == :lite)
      all.order(updated_at: :desc).order(available: :desc).where(:published_on_lite_version => true, :staging => false)
    # Shows all trips on pro which are not staging
    else
      all.order(updated_at: :desc).order(available: :desc).where(:staging => false)
    end
  end
  
  def self.find_trip_with_id(id)
    find(id)
    
    rescue ActiveRecord::RecordNotFound
      return nil
  end
  
  def origin_lat
    return @origin_lat unless @origin_lat.nil?
    origin_coordinate.lat unless origin_coordinate.nil?
  end
  
  def origin_lon
    return @origin_lon unless @origin_lon.nil?
    origin_coordinate.lon unless origin_coordinate.nil?
  end
  
  def final_lat
    return @final_lat unless @final_lat.nil?
    end_coordinate.lat unless end_coordinate.nil?
  end
  
  def final_lon
    return @final_lon unless @final_lon.nil?
    end_coordinate.lon unless end_coordinate.nil?
  end
      
  def self.complexity_enum
    {
      es: ["Difícil", "Media", "Fácil"], 
      en: ["Hard", "Medium", "Easy"]
    }
  end    
      
  def self.lang_enum
    ["es", "en"]
  end
  
  def name
    full_name
  end
  
  def full_name
    "#{title} - #{lang}"
  end
  
  def update_checksum
    self.precompiled_json = TripSerializer.new(self).to_json
    self.checksum = Digest::SHA256.hexdigest(self.precompiled_json) 
  end
  
  protected
  def update_coordinates
    self.origin_coordinate = "POINT(#{self.origin_lon.to_f} #{self.origin_lat.to_f})"
    self.end_coordinate = "POINT(#{self.final_lon.to_f} #{self.final_lat.to_f})"
  end
end
