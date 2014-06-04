class CreatePoiKinds < ActiveRecord::Migration
  def change
    create_table :poi_kinds do |t|
      t.string        :content
      t.string        :keyword
      t.string        :lang
      t.integer       :image_id
      t.timestamps
    end
  end
end
