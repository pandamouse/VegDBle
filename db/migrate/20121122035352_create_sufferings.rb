class CreateSufferings < ActiveRecord::Migration
  def change
    create_table :sufferings do |t|
      t.references :plant
      t.references :sufferable, :polymorphic => true

      t.timestamps
    end
    add_index :sufferings, :plant_id
    add_index :sufferings, [:sufferable_id, :sufferable_type]
  end
end
