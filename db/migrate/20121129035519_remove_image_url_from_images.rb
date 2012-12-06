class RemoveImageUrlFromImages < ActiveRecord::Migration
  def up
    remove_column :images, :image_url
    add_attachment :images, :image_file
  end

  def down
    add_column :images, :image_url, :string
    remove_attachment :images, :image_file
  end
end
