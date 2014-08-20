class AddFieldsToTripAndPoiTables < ActiveRecord::Migration
  def change
    add_column :trips, :published_on_lite_version, :boolean, default: false
    add_column :trips, :staging, :boolean, default: false
    add_column :pois, :published_on_lite_version, :boolean, default: false
  end
end
