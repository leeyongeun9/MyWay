class HomeController < ApplicationController
	def index
    @travels = Travel.all
    @routes = Routes.all
    @albums = Album.all
	end
  def test
  end
  
end
