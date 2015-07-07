class Album < ActiveRecord::Base
  has_many :contents
  belongs_to :section
end
