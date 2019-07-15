import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  Completer<GoogleMapController> _controller = Completer();

  @override
  void initState() {
    super.initState();
  }
  double zoomVal = 15.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: Text("Guia do Santuário de Canindé (CE)"),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.refresh),
              onPressed: () {
                _gotoLocation(-4.358, -39.3137);
              }),
        ],
      ),
      body: Stack(
        children: <Widget>[
          _buildGoogleMap(context),
          _zoomminusfunction(),
          _zoomplusfunction(),
          _buildContainer(),
        ],
      ),
    );
  }

  /*FUNCAO PARA DIMINUIR O ZOOM DA TELA
 * sugestão: EXECUTAR A FUNCAO ENQUANTO O BUTTON ESTIVER PRESSIONADO;*/
 Widget _zoomminusfunction() {
    return Align(
      alignment: Alignment.topLeft,
      child: IconButton(
            icon: Icon(FontAwesomeIcons.searchMinus,color:Color(0xff6200ee)),
            onPressed: () {
              zoomVal--;
             _minus(zoomVal);
            }),
    );
 }

 /*FUNCAO PARA AUMENTAR O ZOOM DA TELA
 * sugestão: EXECUTAR A FUNCAO ENQUANTO O BUTTON ESTIVER PRESSIONADO;*/
 Widget _zoomplusfunction()  {
    return Align(
      alignment: Alignment.topRight,
      child: IconButton(
            icon: Icon(FontAwesomeIcons.searchPlus,color:Color(0xff6200ee)),
            onPressed: () {
              zoomVal++;
              _plus(zoomVal);
            }),
    );
 }

 Future<void> _minus(double zoomVal) async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(target: LatLng(-4.358, -39.3137), zoom: zoomVal)));
  }
 Future<void> _plus(double zoomVal) async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(target: LatLng(-4.358, -39.3137), zoom: zoomVal)));
  }

  
  Widget _buildContainer() {
    return Align(
      alignment: Alignment.bottomLeft,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 20.0),
        height: 150.0,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            SizedBox(width: 10.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _boxes(
                  "https://ia801409.us.archive.org/24/items/basilica_de_caninde/Bas%C3%ADlica_de_S.Francisco-73.jpg",
                  -4.359281, -39.311843,"Basílica de São Francisco\ndas Chagas"),
            ),
            SizedBox(width: 10.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _boxes(
                  "https://ia601503.us.archive.org/6/items/estatua_caninde/21993136.jpg",
                  -4.367470, -39.305115,"Estátua de São Francisco\ndas Chagas"),
            ),
            SizedBox(width: 10.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _boxes(
                  "https://ia601507.us.archive.org/35/items/das_dores/dores.jpg",
                  -4.359086, -39.314841,"Igreja de Nossa Senhora\ndas Dores"),
            ),
            SizedBox(width: 10.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _boxes(
                  "https://ia801408.us.archive.org/21/items/mosteiro_201907/mosteiro.jpg",
                  -4.352859, -39.313711,"Mosteiro das Irmãs Clarissas"),
            ),
            SizedBox(width: 10.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _boxes(
                  "https://ia601408.us.archive.org/8/items/zoo_caninde/7600171_x720.jpg",
                  -4.362529, -39.315197,"Zoológico São Francisco"),
            ),
            SizedBox(width: 10.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _boxes(
                  "https://ia601503.us.archive.org/17/items/convento_caninde/pb-convento1.jpg",
                  -4.361924, -39.314156,"Convento Santo Antônio"),
            ),
          ],
        ),
      ),
    );
  }

  Widget _boxes(String _image, double lat,double long,String titulo) {
    return  GestureDetector(
        onTap: () {
          _gotoLocation(lat,long);
        },
        child:Container(
              child: new FittedBox(
                child: Material(
                    color: Colors.white70,
                    elevation: 14.0,
                    borderRadius: BorderRadius.circular(24.0),
                    shadowColor: Color(0x802196F3),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          width: 180,
                          height: 200,
                          child: ClipRRect(
                            borderRadius: new BorderRadius.circular(24.0),
                            child: Image(
                              fit: BoxFit.fill,
                              image: NetworkImage(_image),
                            ),
                          ),),
                          Container(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: myDetailsContainer1(titulo),
                          ),
                        ),

                      ],)
                ),
              ),
            ),
    );
  }

  Widget myDetailsContainer1(String titulo) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Container(
              child: Text(titulo,
            style: TextStyle(
                color: Color(0xff6200ee),
                fontSize: 24.0,
                fontWeight: FontWeight.bold),
          )),
        ),
        SizedBox(height:5.0),
        Container(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                  child: Text(
                "4.8",
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 18.0,
                ),
              )),
              Container(
                child: Icon(
                  FontAwesomeIcons.solidStar,
                  color: Colors.amber,
                  size: 15.0,
                ),
              ),
              Container(
                child: Icon(
                  FontAwesomeIcons.solidStar,
                  color: Colors.amber,
                  size: 15.0,
                ),
              ),
              Container(
                child: Icon(
                  FontAwesomeIcons.solidStar,
                  color: Colors.amber,
                  size: 15.0,
                ),
              ),
              Container(
                child: Icon(
                  FontAwesomeIcons.solidStar,
                  color: Colors.amber,
                  size: 15.0,
                ),
              ),
              Container(
                child: Icon(
                  FontAwesomeIcons.solidStar,
                  color: Colors.amber,
                  size: 15.0,
                ),
              ),
               Container(
                  child: Text(
                "(773)",
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 18.0,
                ),
              )),
            ],
          )),
          SizedBox(height:5.0),
        Container(
                  child: Text(
                "Telefone: (85) 3343-9950",
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 18.0,
                ),
              )),
              SizedBox(height:5.0),
        Container(
            child: Text(
          "Praça da Basílica, 31 \u00B7 Centro",
          style: TextStyle(
              color: Colors.black54,
              fontSize: 18.0,
              fontWeight: FontWeight.bold),
        )),
      ],
    );
  }

  Widget _buildGoogleMap(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition:  CameraPosition(target: LatLng(-4.358, -39.3137), zoom: 15),
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
        markers: {mosteiroMarker, zoologicoMarker, conventoMarker, basilicaMaker, estatuaMarker, doresMarker},
      ),
    );
  }

  /*
   *
   */
  Future<void> _gotoLocation(double lat,double long) async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(target: LatLng(lat, long), zoom: 20, tilt: 50.0,
      bearing: 45.0,)));
  }
}


/*OS MARCADORES DE LOCALIZAÇÃO QUE APONTA PARA OS PONTOS TURÍSTICOS NO MAPA*/
Marker basilicaMaker = Marker(
  markerId: MarkerId('basilica'),
  position: LatLng(-4.359281, -39.311843),
  infoWindow: InfoWindow(title: 'Basílica de São Francisco das Chagas'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueGreen,
  ),
);
Marker estatuaMarker = Marker(
  markerId: MarkerId('estatua'),
  position: LatLng(-4.367470, -39.305115),
  infoWindow: InfoWindow(title: 'Estátua de São Francisco das Chagas'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueGreen,
  ),
);
Marker doresMarker = Marker(
  markerId: MarkerId('dores'),
  position: LatLng(-4.359086, -39.314841),
  infoWindow: InfoWindow(title: 'Igreja de Nossa Senhora das Dores'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueGreen,
  ),
);
Marker mosteiroMarker = Marker(
  markerId: MarkerId('mosteiro'),
  position: LatLng(-4.352859, -39.313711),
  infoWindow: InfoWindow(title: 'Mosteiro das Irmãs Clarissas'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueGreen,
  ),
);
Marker zoologicoMarker = Marker(
  markerId: MarkerId('zoologico'),
  position: LatLng(-4.362529, -39.315197),
  infoWindow: InfoWindow(title: 'Zoológico São Francisco'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueGreen,
  ),
);
Marker conventoMarker = Marker(
  markerId: MarkerId('convento'),
  position: LatLng(-4.361924, -39.314156),
  infoWindow: InfoWindow(title: 'Convento Santo Antônio'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueGreen,
  ),
);