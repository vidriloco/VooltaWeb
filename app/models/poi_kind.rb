class PoiKind < ActiveRecord::Base
  belongs_to :image
  
  def lang_enum
    ["es", "en"]
  end
  
  def full_name
    keyword
  end

end
