class CreatePois < ActiveRecord::Migration
  def change
    create_table :pois do |t|
      t.integer     :poi_category_id
      t.integer     :poi_kind_id
      t.boolean     :listed
      t.boolean     :sponsored
      t.point       :coordinates, :geographic => true
      t.integer     :image_id
      t.string      :details
      t.string      :title
      t.integer     :trip_id
      t.string      :mode
      t.boolean     :published
      t.timestamps
    end
  end
end
