class CreateCompanions < ActiveRecord::Migration
  def change
    create_table :companions do |t|
      t.integer :r_plant_id
      t.integer :l_plant_id
      t.integer :companion_function_id
      t.text :description
      t.boolean :complimentary

      t.timestamps
    end
  end
end
