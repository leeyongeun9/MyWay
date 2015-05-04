var map;
var drawingManager;
var placeIdArray = [];
var polylines = [];
var snappedCoordinates = [];

function initialize() {
  var mapOptions = {
    zoom: 12,
    center: {lat: -33.8667, lng: 151.1955}
  };
	map = new google.maps.Map(document.getElementById('map_canvas'), mapOptions);

  // Adds a Places search box. Searching for a place will center the map on that
  // location.
  map.controls[google.maps.ControlPosition.RIGHT_TOP].push(
      document.getElementById('bar'));
  var autocomplete = new google.maps.places.Autocomplete(
      document.getElementById('autoc'));
  autocomplete.bindTo('bounds', map);
  autocomplete.addListener('place_changed', function() {
    var place = autocomplete.getPlace();
    if (place.geometry.viewport) {
      map.fitBounds(place.geometry.viewport);
    } else {
      map.setCenter(place.geometry.location);
      map.setZoom(17);
    }
  });

  // Enables the polyline drawing control. Click on the map to start drawing a
  // polyline. Each click will add a new vertice. Double-click to stop drawing.
  drawingManager = new google.maps.drawing.DrawingManager({
    drawingMode: google.maps.drawing.OverlayType.POLYLINE,
    drawingControl: true,
    drawingControlOptions: {
      position: google.maps.ControlPosition.TOP_CENTER,
      drawingModes: [
        google.maps.drawing.OverlayType.POLYLINE
      ]
    },
    polylineOptions: {
      strokeColor: '#696969',
      strokeWeight: 2
    }
  });
  drawingManager.setMap(map);

	
  // Snap-to-road when the polyline is completed.
  drawingManager.addListener('polylinecomplete', function(poly) {
    var path = poly.getPath();
    placeIdArray = [];
    var removal = [];
    removal.push(poly);
    removePoly(removal);
		makePathOnRoad(path);
  });

  // Clear button. Click to remove all polylines.
  $('#clear').click(function(ev) {	
 		removePoly(polylines); 
		ev.preventDefault;
	});
}
function removePoly(poly){
	for (var i = 0; i < poly.length; ++i) {
      poly[i].setMap(null);
	}
	poly = [];
	return false;
}


function makePathOnRoad(path) {
	var service = new google.maps.DirectionsService();
	var drawpath = new google.maps.Polyline({
			strokeColor: "blue",
			strokeOpacity: 1.0,
			strokeWeight: 2
	});
	drawpath.setMap(map);
	var snapPath = [];
	for (destIdx = 0; destIdx < path.length -1 ; destIdx++){
		service.route({
			origin: path.getAt(destIdx).toUrlValue(),
			destination: path.getAt(destIdx+1).toUrlValue(),
			travelMode: google.maps.DirectionsTravelMode.DRIVING
		}, function (result, status) {
			if (status == google.maps.DirectionsStatus.OK) {
				snapPath = snapPath.concat(result.routes[0].overview_path);
        drawpath.setPath(snapPath);
			} else console.log("Direction request failed: " + status);
		});
	}
  polylines.push(drawpath);
}
$(window).load(initialize);

