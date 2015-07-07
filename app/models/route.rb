class Route < ActiveRecord::Base
  has_many :sections
  belongs_to :travel

  def self.create_route(params)
    route = Route.create(
      travel: params[:travel],
      name: params[:name],
      date1: params[:date1],
      date2: params[:date2],
      decription: params[:description],
      point: params[:point]
    )
  end
end
