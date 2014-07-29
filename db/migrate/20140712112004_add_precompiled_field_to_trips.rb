class AddPrecompiledFieldToTrips < ActiveRecord::Migration
  def change
    add_column :trips, :precompiled_json, :text
  end
end
