class Plant < ActiveRecord::Base
  attr_accessible :common_name, :description, :dimension, :parent_id, :position_id, :sci_name, :image_url

  has_many :subplants, :class_name => "Plant", :foreign_key => "parent_id"
  belongs_to :parent, :class_name => "Plant"
  
  has_many :r_companions, :class_name => "Companion", :foreign_key => :r_plant_id
  has_many :l_companions, :class_name => "Companion", :foreign_key => :l_plant_id
  has_many :complimentary_r_plants, :through => :r_companions, :source => :r_plant, :conditions => ['complimentary = ?', true]

  has_many :complimentary_l_plants, :through => :l_companions, :source => :l_plant, :conditions => ['complimentary = ?', true]

  has_many :non_complimentary_r_plants, :through => :r_companions, :source => :r_plant, :conditions => ['complmentary = ?', false]
  has_many :non_complimentary_l_plants, :through => :l_companions, :source => :l_plant, :conditions => ['complmentary = ?', false]

  has_many :images, :as => :imageable
end
