class Companion < ActiveRecord::Base
  attr_accessible :companion_function_id, :complimentary, :description, :l_plant_id, :r_plant_id
  belongs_to :r_plant, :class_name => "Plant"
  belongs_to :l_plant, :class_name => "Plant"
end
