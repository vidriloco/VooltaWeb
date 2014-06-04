class CreateSlides < ActiveRecord::Migration
  def change
    create_table :slides do |t|
      t.string          :title
      t.string          :subtitle
      t.text            :url
      t.integer         :image_id
      t.boolean         :aligned_to_right
      t.boolean         :main_slide
      t.boolean         :contrasted
      t.integer         :order
      t.integer         :poi_id
      t.timestamps
    end
    
    add_index :slides, [:order, :poi_id]
    
  end
end
