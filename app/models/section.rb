class Section < ActiveRecord::Base
  has_many :albums
  belongs_to :route
end
