class AddIdFieldToPoiTrips < ActiveRecord::Migration
  def change
    add_column :poi_trips, :id, :primary_key
    add_column :pois, :staging, :boolean
  end
end
