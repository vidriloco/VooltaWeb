class PoiTrip < ActiveRecord::Base
  belongs_to :poi
  belongs_to :trip
end
