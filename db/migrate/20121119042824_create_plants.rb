class CreatePlants < ActiveRecord::Migration
  def change
    create_table :plants do |t|
      t.string :sci_name
      t.string :common_name
      t.text :description
      t.integer :parent_id
      t.integer :dimension
      t.integer :position_id
      t.string :image_url

      t.timestamps
    end
  end
end
