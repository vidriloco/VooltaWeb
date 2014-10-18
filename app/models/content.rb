class Content < ActiveRecord::Base
  belongs_to :contentable, polymorphic: true, :inverse_of => :contents
  belongs_to :image
  
  after_save      :update_trip_checksum
  after_destroy   :update_trip_checksum
  
  validates :order, presence: true
  
  scope :staged_trips, -> { Content.joins("INNER JOIN trips ON contents.contentable_id = trips.id").where("contents.contentable_type = 'Trip' AND trips.staging = TRUE") }
  scope :staged_pois, -> { Content.joins("INNER JOIN pois ON contents.contentable_id = pois.id").where("contents.contentable_type = 'Poi' AND pois.staging = TRUE") }
  
  rails_admin do
    edit do
      include_all_fields
      exclude_fields :created_at, :updated_at, :trip_id
      
      field :html_string, :code_mirror
    end

    list do
      scopes [:staged_trips, :staged_pois, nil]
      field :id
      field :lang
      field :kind
      field :order_in_contentable do
        sortable :order
      end
    end
  end
  
  def lang
    contentable.blank? ? nil : contentable.lang
  end
  
  def order_in_contentable
    title = contentable.blank? ? nil : contentable.title
    "#{order} : #{contentable_type} - #{title}"
  end
  
  def kind_enum
    Content.kinds
  end
  
  def self.kinds
    ["route_controls", "paragraph", "legend", "photograph", "poi_table", "webview"]
  end
  
  def route_controls?
    self.kind == kind_enum[0]
  end
  
  def paragraph?
    self.kind == kind_enum[1]
  end
  
  def legend?
    self.kind == kind_enum[2]
  end
  
  def photograph?
    self.kind == kind_enum[3]
  end
  
  def poi_table?
    self.kind == kind_enum[4]
  end
  
  def webview?
    self.kind == kind_enum[5]
  end
  
  def full_name
    self.kind
  end
  
  protected 
  def update_trip_checksum
    (contentable.update_checksum && contentable.save) if(contentable_type == Trip.to_s)
    contentable.update_trips if(contentable_type == Poi.to_s)
  end
end
