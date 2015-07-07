class HomeController < ApplicationController
	def index
    @travels = Travel.all
    @routes = Route.all
    @albums = Album.all
	end
  def test
  end
  
end
