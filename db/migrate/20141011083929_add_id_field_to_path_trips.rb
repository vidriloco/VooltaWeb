class AddIdFieldToPathTrips < ActiveRecord::Migration
  def change
    add_column :path_trips, :id, :primary_key
  end
end
