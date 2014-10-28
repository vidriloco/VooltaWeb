class PerformChangesToTripsAssociatedTables < ActiveRecord::Migration
  def change
    create_table :poi_trips, id: false do |t|
      t.belongs_to :poi
      t.belongs_to :trip
    end
        
    remove_column :pois, :trip_id, :integer
    remove_column :paths, :trip_id, :integer
  end
end
