class CreateTripResources < ActiveRecord::Migration
  def change
    create_table :trip_resources do |t|
      t.string        :identifier
      t.timestamps
    end
  end
end
