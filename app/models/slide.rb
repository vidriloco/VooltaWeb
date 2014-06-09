class Slide < ActiveRecord::Base
  belongs_to :poi
  belongs_to :image
  
  after_save      :update_trips_checksum
  after_destroy   :update_trips_checksum
    
  rails_admin do         
    list do
      field :id
      field :lang
      field :title_
      field :order_in_poi
      field :image
      field :poi_name
      field :order_in_poi do
        sortable :order
      end
    end
  end
  
  def title_
    self.title.blank? ? "MAIN SLIDE" : self.title
  end
  
  def lang
    poi.lang
  end
  
  def poi_name
    "#{poi.title} - #{poi.trips.first.lang}"
  end
  
  def order_in_poi
    "#{order} : #{poi_name}"
  end
    
  protected 
  def update_trips_checksum
    poi.update_trips
  end
end
