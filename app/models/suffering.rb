class Suffering < ActiveRecord::Base
  belongs_to :plant
  belongs_to :sufferable
  # attr_accessible :title, :body
end
