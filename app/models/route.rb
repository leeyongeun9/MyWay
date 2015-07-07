class Route < ActiveRecord::Base
  has_many :sections
  belongs_to :travel
end
