class CreatePoiCategories < ActiveRecord::Migration
  def change
    create_table :poi_categories do |t|
      t.string        :content
      t.string        :keyword
      t.string        :lang
      t.integer       :image_id
      t.timestamps
    end
  end
end
