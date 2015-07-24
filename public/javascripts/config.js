var GtfsEditor = GtfsEditor || {};

(function(G, $) {

  G.config = {
    mapboxServer: 'http://{s}.tile.thunderforest.com/transport/',
    mapboxServerSatellite: 'http://{s}.tiles.mapbox.com/v3/conveyal.map-a3mk3jug/',
    agencyId: 1,
    mapCenter: [38.923092, -77.038879],
    mapZoom: 15, 
    showMajorStops: true,
    showStandardStops: true,
    baseUrl: '/'
  };

})(GtfsEditor, jQuery);
