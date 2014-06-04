class CreatePaths < ActiveRecord::Migration
  def change
    create_table :paths do |t|
      t.integer        :thickness
      t.string         :color
      t.text           :coordinates_vector
      t.string         :name
      t.string         :details
      t.integer        :trip_id
      t.timestamps
    end
    
    create_table :paths_trips, id: false do |t|
      t.belongs_to :path
      t.belongs_to :trip
    end
  end
end
