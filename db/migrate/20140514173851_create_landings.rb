class CreateLandings < ActiveRecord::Migration
  def change
    create_table :landings do |t|
      t.integer     :user_id
      t.integer     :image_id
      t.string      :name
      t.timestamps
    end
  end
end
