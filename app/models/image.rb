class Image < ActiveRecord::Base
  has_many :poi_kinds
  has_many :poi_categories
  has_many :landings
  has_many :main_images, class_name: 'Trip', foreign_key: 'main_image_id'
  has_many :background_images, class_name: 'Trip', foreign_key: 'background_image_id'
  has_many :contents
  has_many :pois
  has_many :slides
  
  validates :url, uniqueness: true, on: :create
  validates :url, presence: true
  
  before_save       :update_checksum
  after_save        :regenerate_cache
  
  @@precompiled_json=nil
  def self.regenerate_cache_inventory
    @@precompiled_json = ActiveModel::ArraySerializer.new(Image.where(:image_type => ["background", "icon"]), each_serializer: ImageInventorySerializer).to_json
  end
  
  def self.cached_inventory
    Image.regenerate_cache_inventory if @@precompiled_json.nil?
    @@precompiled_json
  end
  
  def self.image_type_enum
    ["background", "icon", "photo"]
  end
  
  def filename
    return "" if url.nil?
    url.split('/').last
  end
  
  def full_name
    name
  end
  
  protected
  
  def regenerate_cache
    if self.image_type.in?(["background", "icon"])
      Image.regenerate_cache_inventory
    end
  end
  
  def update_checksum
    self.checksum = Digest::SHA256.hexdigest(ImageSerializer.new(self).to_json) 
  end

end
