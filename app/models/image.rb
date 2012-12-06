class Image < ActiveRecord::Base
  attr_accessible :image_file, :imageable_id, :imageable_type
  has_attached_file :image_file, :styles => { :medium => "300x300>", :thumb => "100x100>"}
  belongs_to :imageable, :polymorphic => true
end