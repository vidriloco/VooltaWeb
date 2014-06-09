class Content < ActiveRecord::Base
  belongs_to :contentable, polymorphic: true, :inverse_of => :contents
  belongs_to :image
  
  after_save      :update_trip_checksum
  after_destroy   :update_trip_checksum
  
  validates :order, presence: true
  
  rails_admin do
    edit do
      include_all_fields
      exclude_fields :created_at, :updated_at, :trip_id
      
      field :html_string, :code_mirror
    end

    list do
      field :id
      field :lang
      field :kind
      field :order_in_contentable do
        sortable :order
      end
    end
  end
  
  def lang
    contentable.lang
  end
  
  def order_in_contentable
    "#{order} : #{contentable_type} - #{contentable.title}"
  end
  
  def kind_enum
    ["route_controls", "paragraph", "legend", "photograph", "poi_table", "webview"]
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
