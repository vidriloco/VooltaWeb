class CreateTrips < ActiveRecord::Migration
  def change
    create_table :trips do |t|
      t.integer       :trip_resource_id
      t.string        :distance
      t.string        :title
      t.string        :details
      t.string        :complexity
      t.integer       :background_image_id
      t.integer       :cost, :default => 0
      t.boolean       :available
      t.integer       :main_image_id
      t.integer       :user_id
      t.string        :lang
      t.point         :origin_coordinate, :geographic => true
      t.point         :end_coordinate, :geographic => true
      t.text          :checksum
      
      t.timestamps
    end
    
  end
end
