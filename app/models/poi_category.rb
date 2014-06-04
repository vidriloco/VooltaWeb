class PoiCategory < ActiveRecord::Base
  belongs_to :image
  
  validates :content, :keyword, :lang, :image, presence: true
  
  def lang_enum
    ["es", "en"]
  end
  
  def full_name
    keyword
  end
end
