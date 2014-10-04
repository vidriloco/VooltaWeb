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
    
    create_table :path_trips, id: false do |t|
      t.belongs_to :path
      t.belongs_to :trip
    end
    
    add_index   :path_trips, [:path_id, :trip_id],  unique: true
  end
end
