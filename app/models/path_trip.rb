class PathTrip < ActiveRecord::Base
  belongs_to :path
  belongs_to :trip
end
