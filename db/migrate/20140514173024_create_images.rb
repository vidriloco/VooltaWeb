class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string        :url
      t.string        :name
      t.string        :image_type
      t.string        :attribution_url
      t.string        :attribution_info
      t.text          :checksum
      t.timestamps
    end
    
    add_index   :images, :url,  unique: true
  end
end
