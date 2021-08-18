part of 'pages.dart';

class MapAdd extends StatelessWidget {
  final String dataPath;

  MapAdd({Key key, this.dataPath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: _MapAdd(dataPath),
    ));
  }
}

class _MapAdd extends StatefulWidget {
  final String dataPath;

  _MapAdd(this.dataPath);

  @override
  _MapAddState createState() => _MapAddState();
}

class _MapAddState extends State<_MapAdd> {
  final _controller = Get.put(MapAddController());
  GoogleMapController controller;

  Map<MarkerId, Marker> markers = <MarkerId, Marker>{};
  Map<PolylineId, Polyline> polylines = <PolylineId, Polyline>{};
  int _polylineIdCounter = 0;
  int _markerIdCounter = 0;

  List<LatLng> points = List<LatLng>();

  LatLng initPosition;

  var isLoading = true;
  final LatLng currentPosition = LatLng(-7.801038, 110.376561);

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

        final String markerIdVal = 'marker_id_$i';
        final MarkerId markerId = MarkerId(markerIdVal);

        final String polylineIdVal = 'polyline_id_$i';
        final PolylineId polylineId = PolylineId(polylineIdVal);

        final icon = await BitmapDescriptorHelper.getClusterMarker(
            0, Colors.blueAccent, Colors.white, 50);

        final Marker marker = Marker(
            markerId: markerId,
            position: new LatLng(double.parse(pos[0]), double.parse(pos[1])),
            onTap: () {
              _remove(markerId, polylineId);
            },
            icon: icon);

        lineLatLng.add(new LatLng(double.parse(pos[0]), double.parse(pos[1])));

        final Polyline polyline = Polyline(
          polylineId: polylineId,
          consumeTapEvents: true,
          color: Colors.red,
          width: 5,
          points: lineLatLng,
        );

        setState(() {
          markers[markerId] = marker;
          polylines[polylineId] = polyline;
          points = lineLatLng;
          _markerIdCounter = i;
          _polylineIdCounter = i;
        });
      }

      setState(() {});
    }
  }

  void _onMapCreated(GoogleMapController controller) {
    controller = controller;
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
            markers: Set<Marker>.of(markers.values),
            polylines:
                polylines != null ? Set<Polyline>.of(polylines.values) : null,
            onMapCreated: (controller) => _onMapCreated(controller),
            onTap: _handleTap,
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
          left: 0,
          right: 0,
          bottom: 30,
          child: Container(
            width: 300,
            height: 45,
            padding: EdgeInsets.symmetric(horizontal: Themes.defaultMargin),
            child: RaisedButton(
              onPressed: () async {},
              elevation: 0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              color: Themes.primaryColor,
              child: Text("Simpan", style: Themes.whiteTextStyle),
            ),
          ),
        ),
      ],
    );
  }

  _handleTap(LatLng tappedPoint) async {
    int idMarker = markers.length + _markerIdCounter;
    final String markerIdVal = 'marker_id_$idMarker';
    _markerIdCounter++;
    final MarkerId markerId = MarkerId(markerIdVal);

    int idMPolyline = polylines.length + _polylineIdCounter;
    final String polylineIdVal = 'polyline_id_$idMPolyline';
    _polylineIdCounter++;
    final PolylineId polylineId = PolylineId(polylineIdVal);

    final icon = await BitmapDescriptorHelper.getClusterMarker(
        0, Colors.blueAccent, Colors.white, 50);

    final Marker marker = Marker(
        markerId: markerId,
        position: tappedPoint,
        onTap: () {
          _remove(markerId, polylineId);
        },
        onDragEnd: (LatLng position) {},
        icon: icon);

    setState(() {
      markers[markerId] = marker;

      points.add(marker.position);
    });

    final Polyline polyline = Polyline(
      polylineId: polylineId,
      consumeTapEvents: true,
      color: Colors.red,
      width: 5,
      points: points,
    );

    setState(() {
      polylines[polylineId] = polyline;
    });
  }

  void _remove(MarkerId markerId, PolylineId polylineId) {
    setState(() {
      int index =
          polylines[polylineId].points.indexOf(markers[markerId].position);

      if (polylines.containsKey(polylineId)) {
        points.removeAt(index);
        polylines.remove(polylineId);
      }

      if (markers.containsKey(markerId)) {
        markers.remove(markerId);
      }
    });
  }
}
