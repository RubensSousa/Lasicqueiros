import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import "package:google_maps_webservice/directions.dart" hide Polyline;

void main() {
  runApp(MyApp());
}
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  GoogleMapController mapController;

  static const LatLng _center = const LatLng(-4.358, -39.3137);
  final Set<Marker> _markers = {};
  final Set<Polyline> _polyline={};

  //add your lat and lng where you wants to draw polyline
  LatLng _lastMapPosition = _center;
  List<LatLng> latlng = List();
  LatLng ifce = LatLng(-4.390037, -39.313506);
  LatLng basilica = LatLng(-4.359214, -39.311897);
  LatLng estatua = LatLng(-4.367588, -39.305157);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;

  }

  @override
  Widget build(BuildContext context) {
    final pontos = [
      LatLng( -4.3900122, -39.3135415),
      LatLng( -4.3897075, -39.3132459),
      LatLng( -4.3596578, -39.3018742),
      LatLng( -4.3590602, -39.30713069999999),
      LatLng( -4.3618225, -39.3076787),
      LatLng( -4.3598089, -39.3119795),
      LatLng( -4.3592903, -39.3124814)
    ];

    latlng.add(ifce);
    latlng.addAll(pontos);
    latlng.add(basilica);

    final direcoes = new GoogleMapsDirections();

    setState(() {
      _markers.add(Marker(
        // This marker id can be anything that uniquely identifies each marker.
        markerId: MarkerId(_lastMapPosition.toString()),
        //_lastMapPosition is any coordinate which should be your default
        //position when map opens up
        position: _lastMapPosition,
        infoWindow: InfoWindow(
          title: 'Really cool place',
          snippet: '5 Star Rating',
        ),
        icon: BitmapDescriptor.defaultMarker,

      ));
      //ifce
      _markers.add(Marker(
        // This marker id can be anything that uniquely identifies each marker.
        markerId: MarkerId(ifce.toString()),
        //_lastMapPosition is any coordinate which should be your default
        //position when map opens up
        position: ifce,
        infoWindow: InfoWindow(
          title: 'IFCE - Posição correta',
          snippet: '5 Star Rating',
        ),
        icon: BitmapDescriptor.defaultMarker,

      ));
      //basilica
      //ifce
      _markers.add(Marker(
        // This marker id can be anything that uniquely identifies each marker.
        markerId: MarkerId(basilica.toString()),
        //_lastMapPosition is any coordinate which should be your default
        //position when map opens up
        position: basilica,
        infoWindow: InfoWindow(
          title: 'Basilica - Posição correta',
          snippet: '5 Star Rating',
        ),
        icon: BitmapDescriptor.defaultMarker,

      ));
      _polyline.add(Polyline(
        polylineId: PolylineId(_lastMapPosition.toString()),
        visible: true,
        //latlng is List<LatLng>
        points: latlng,
        color: Colors.blue,
      ));
    });

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Guia do santuário'),
          backgroundColor: Colors.green[700],
        ),
        body: GoogleMap(
          polylines:_polyline,
          markers: _markers,
          onMapCreated: _onMapCreated,
          myLocationEnabled:true,
          initialCameraPosition: CameraPosition(
            target: _center,
            zoom: 11.0,
          ),
        ),
      ),
    );
  }
}