class PoiKind < ActiveRecord::Base
  belongs_to :image
  
  validates :content, :keyword, :lang, :image, presence: true
  
  scope :english, -> { where(lang: 'en') }
  scope :spanish, -> { where(lang: 'es') }
  
  rails_admin do  
    list do
      scopes [:english, :spanish, nil]  
    end
  end
  
  def lang_enum
    ["es", "en"]
  end
  
  def full_name
    keyword
  end

end
