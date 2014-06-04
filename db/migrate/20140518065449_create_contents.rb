class CreateContents < ActiveRecord::Migration
  def change
    create_table :contents do |t|
      t.integer       :order
      t.string        :kind
      t.text          :content
      t.string        :title
      t.string        :subtitle
      # represented on JSON response as: filename, icon
      t.integer       :image_id
      t.string        :details
      t.boolean       :full_width
      t.string        :caption
      t.string        :table_title
      t.text          :html_string
      t.float         :image_height, default: 200
      
      t.integer       :contentable_id
      t.string        :contentable_type
      t.timestamps
    end
    
    add_index   :contents, [:order, :contentable_id, :contentable_type],  unique: true
  end
end
