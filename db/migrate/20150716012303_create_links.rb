class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.integer :user_id
      t.string :title
      t.string :author_url
      t.string :provider_name
      t.string :title
      t.string :content
      t.string :html
      t.string :thumbnail_url
      t.string :thumbnail_height
      t.string :thumbnail_width

      t.timestamps null: false
    end
  end
end
