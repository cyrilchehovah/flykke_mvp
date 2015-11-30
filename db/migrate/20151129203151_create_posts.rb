class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.string :description
      t.string :category
      t.string :interest
      t.string :type
      t.string :url
      t.string :image
      t.string :video
      t.string :site_name
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
