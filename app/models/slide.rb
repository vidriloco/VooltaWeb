class Slide < ActiveRecord::Base
  belongs_to :poi
  belongs_to :image
  
  after_save      :update_trip_checksum
  after_destroy   :update_trip_checksum
    
  rails_admin do         
    list do
      field :id
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
  
  def poi_name
    "#{poi.title} - #{poi.trip.lang}"
  end
  
  def order_in_poi
    "#{order} : #{poi_name}"
  end
    
  protected 
  def update_trip_checksum
    (poi.trip.update_checksum && poi.trip.save)
  end
end
