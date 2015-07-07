class Travel < ActiveRecord::Base
  has_many :routes
  has_many :travels
  belongs_to :user
  belongs_to :travel
end
