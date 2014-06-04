class Image < ActiveRecord::Base
  has_many :poi_kinds
  has_many :poi_categories
  has_many :landings
  has_many :main_images, class_name: 'Trip', foreign_key: 'main_image_id'
  has_many :background_images, class_name: 'Trip', foreign_key: 'background_image_id'
  has_many :contents
  has_many :pois
  has_many :slides
  
  validates :url, uniqueness: true
  
  before_save       :update_checksum
  
  def image_type_enum
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
  
  def update_checksum
    self.checksum = Digest::SHA256.hexdigest(ImageSerializer.new(self).to_json) 
  end

end
