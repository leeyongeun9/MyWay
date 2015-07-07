class HomeController < ApplicationController
	def index
    @travels = Travel.all
    @routes = Route.all
    @albums = Album.all
	end
  def test
  end

  def addpath
    @parameter = {
      travel : "first",
      name : "route1",
      date1 : "04/03/14",
      date2 : "04/03/14",
      description : "it is about test",
      point : params[:path]
    }
    Route.create_route(parameter)
    redirect_to '/'
  end
  
end
