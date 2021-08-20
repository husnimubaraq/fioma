part of 'pages.dart';

class MapView extends StatelessWidget {
  final String dataPath;

  MapView({Key key, this.dataPath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: _MapView(dataPath),
    ));
  }
}

class _MapView extends StatefulWidget {
  final String dataPath;

  _MapView(this.dataPath);

  @override
  _MapViewState createState() => _MapViewState();
}

class _MapViewState extends State<_MapView> {
  final _controller = Get.put(MapViewController());
  GoogleMapController googleMapController;

  Map<MarkerId, Marker> _markers = <MarkerId, Marker>{};
  Map<MarkerId, Marker> _markersPath = <MarkerId, Marker>{};

  Map<PolylineId, Polyline> polylines = <PolylineId, Polyline>{};

  LatLng initPosition;

  final LatLng currentPosition = LatLng(-7.801038, 110.376561);

  final TextEditingController destController = TextEditingController();

  BitmapDescriptor customIcon;

  @override
  void initState() {
    String dataPath = "";
    KabelPath paths;

    if (widget.dataPath != null) {
      Map<String, dynamic> json = jsonDecode(widget.dataPath);
      paths = KabelPath.fromJson(json);

      List<String> initPos = paths.initialPosition.split(", ");
      setState(() {
        initPosition =
            new LatLng(double.parse(initPos[0]), double.parse(initPos[1]));
      });
    }

    // BitmapDescriptorHelper.getBytesFromAsset("assets/images/pin.png", 64);

    super.initState();
  }

  void init() async {
    String dataPath = "";
    KabelPath paths;

    if (widget.dataPath != null) {
      Map<String, dynamic> json = jsonDecode(widget.dataPath);
      paths = KabelPath.fromJson(json);

      List<LatLng> lineLatLng = List<LatLng>();
      for (int i = 0; i < paths.pathInfo.length; i++) {
        List<String> pos = paths.pathInfo[i].split(", ");

        final icon = await BitmapDescriptorHelper.getClusterMarker(
            (i + 1), Colors.blueAccent, Colors.white, 50);

        final String markerIdVal = 'marker_id_$i';
        final MarkerId markerId = MarkerId(markerIdVal);

        final Marker marker = Marker(
            markerId: markerId,
            position: new LatLng(double.parse(pos[0]), double.parse(pos[1])),
            icon: icon);

        lineLatLng.add(new LatLng(double.parse(pos[0]), double.parse(pos[1])));

        final String polylineIdVal = 'polyline_id_$i';
        final PolylineId polylineId = PolylineId(polylineIdVal);

        final Polyline polyline = Polyline(
          polylineId: polylineId,
          consumeTapEvents: true,
          color: Colors.red,
          width: 5,
          points: lineLatLng,
        );

        setState(() {
          _markers[markerId] = marker;
          polylines[polylineId] = polyline;
        });
      }
    }
  }

  void _onMapCreated(GoogleMapController controller) {
    googleMapController = controller;
    init();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          child: GoogleMap(
            initialCameraPosition: CameraPosition(
                target: initPosition ?? currentPosition, zoom: 16),
            mapType: MapType.normal,
            markers: Set<Marker>.of(_markers.values),
            polylines:
                polylines != null ? Set<Polyline>.of(polylines.values) : null,
            onMapCreated: (controller) => _onMapCreated(controller),
            zoomControlsEnabled: false,
          ),
        ),
        Positioned(
            left: 0,
            right: 0,
            top: 0,
            child: Container(
              color: Colors.white,
              height: 70,
              padding: EdgeInsets.only(
                  top: 20, left: Themes.defaultMargin, right: 20, bottom: 15),
              child: Stack(
                children: <Widget>[
                  Align(
                    alignment: Alignment.centerLeft,
                    child: InkWell(
                      onTap: () {
                        Get.back();
                        return;
                      },
                      child: Icon(
                        Icons.arrow_back,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topCenter,
                    child: Text(
                      "Peta Kabel FO",
                      style: Themes.headerTextStyle
                          .copyWith(color: Themes.blackColor),
                    ),
                  ),
                ],
              ),
            )),
        Positioned(
            bottom: 10,
            right: 10,
            child: FloatingActionButton(
                child: Icon(Icons.alt_route),
                onPressed: () async {
                  _showDialog(context);
                }))
      ],
    );
  }

  Future<void> _showDialog(BuildContext _context) async {
    return showDialog(
        context: _context,
        builder: (_context) {
          return AlertDialog(
            title: Text("Tentukan jarak"),
            content: TextField(
              onChanged: (text) {},
              controller: destController,
              decoration: InputDecoration(hintText: "Masukan jarak"),
              keyboardType: TextInputType.number,
            ),
            actions: [
              FlatButton(
                onPressed: () async {
                  for (int i = 0; i < _markers.length; i++) {
                    final String markerIdVal = 'marker_2_id_$i';
                    final MarkerId markerId = MarkerId(markerIdVal);
                    final String polylineIdVal = 'polyline_2_id_$i';
                    final PolylineId polylineId = PolylineId(polylineIdVal);
                    setState(() {
                      _markers.remove(markerId);
                      polylines.remove(polylineId);
                    });
                  }
                  List<LatLng> listPathInfo = [];
                  List<LatLng> newPath = [];
                  double totalDistance = 0.0;
                  double newDistance = 0.0;
                  double head = 0.0;
                  int newIndex = -1;

                  for (var kv in _markers.entries) {
                    listPathInfo.add(new LatLng(kv.value.position.latitude,
                        kv.value.position.longitude));
                  }
                  for (int i = 0; i < listPathInfo.length; i++) {
                    if (i < listPathInfo.length - 1) {
                      totalDistance += Geolocator.distanceBetween(
                          listPathInfo[i].latitude,
                          listPathInfo[i].longitude,
                          listPathInfo[i + 1].latitude,
                          listPathInfo[i + 1].longitude);

                      if (totalDistance < double.parse(destController.text)) {
                        newDistance = totalDistance;
                        newIndex = i;

                        newPath.add(new LatLng(listPathInfo[i].latitude,
                            listPathInfo[i].longitude));

                        head = mp.SphericalUtil.computeHeading(
                            mp.LatLng(listPathInfo[i].latitude,
                                listPathInfo[i].longitude),
                            mp.LatLng(listPathInfo[i + 1].latitude,
                                listPathInfo[i + 1].longitude));
                      }
                    }
                  }

                  // bool cekLength =
                  //     double.parse(destController.text) > totalDistance;

                  if (double.parse(destController.text) > totalDistance) {
                    Fluttertoast.showToast(
                        msg: 'Panjang maksimal kabel: ' +
                            totalDistance.toStringAsFixed(0),
                        gravity: ToastGravity.BOTTOM);
                  } else {
                    final length =
                        double.parse(destController.text) - newDistance;

                    if (newDistance > length) {
                    } else {
                      // head = mp.SphericalUtil.computeHeading(
                      //     mp.LatLng(listPathInfo[0].latitude,
                      //         listPathInfo[0].longitude),
                      //     mp.LatLng(listPathInfo[1].latitude,
                      //         listPathInfo[1].longitude));

                      // final tempPos = mp.SphericalUtil.computeOffset(
                      //     mp.LatLng(listPathInfo[0].latitude,
                      //         listPathInfo[0].longitude),
                      //     double.parse(destController.text),
                      //     head);

                      // newPath
                      //     .add(new LatLng(tempPos.latitude, tempPos.longitude));
                    }

                    if (listPathInfo[listPathInfo.length - 3] ==
                        newPath[newPath.length - 1]) {
                      newPath.add(new LatLng(
                          listPathInfo[listPathInfo.length - 2].latitude,
                          listPathInfo[listPathInfo.length - 2].longitude));

                      head = mp.SphericalUtil.computeHeading(
                          mp.LatLng(
                              listPathInfo[listPathInfo.length - 2].latitude,
                              listPathInfo[listPathInfo.length - 2].longitude),
                          mp.LatLng(
                              listPathInfo[listPathInfo.length - 1].latitude,
                              listPathInfo[listPathInfo.length - 1].longitude));
                    }
                    final tempPos = mp.SphericalUtil.computeOffset(
                        mp.LatLng(newPath[newPath.length - 1].latitude,
                            newPath[newPath.length - 1].longitude),
                        length,
                        head);

                    newPath
                        .add(new LatLng(tempPos.latitude, tempPos.longitude));

                    List<LatLng> lineLatLng = List<LatLng>();
                    for (int i = 0; i < newPath.length; i++) {
                      int markIdIndex = newPath.length - 1;

                      final String markerIdVal = 'marker_2_id_$markIdIndex';
                      final MarkerId markerId = MarkerId(markerIdVal);

                      final Marker marker = Marker(
                          markerId: markerId,
                          position: newPath[i],
                          icon: BitmapDescriptor.defaultMarker);

                      lineLatLng.add(newPath[i]);

                      final String polylineIdVal = 'polyline_2_id_$i';
                      final PolylineId polylineId = PolylineId(polylineIdVal);

                      final Polyline polyline = Polyline(
                          polylineId: polylineId,
                          consumeTapEvents: true,
                          color: Colors.yellowAccent,
                          width: 5,
                          points: lineLatLng,
                          patterns: [PatternItem.dot],
                          startCap: Cap.roundCap,
                          endCap: Cap.roundCap);

                      setState(() {
                        _markers[markerId] = marker;
                        polylines[polylineId] = polyline;
                      });
                    }
                    Navigator.pop(_context);
                  }
                },
                child: Text("Submit"),
                color: Colors.blue,
                textColor: Colors.white,
              )
            ],
          );
        });
  }
}
