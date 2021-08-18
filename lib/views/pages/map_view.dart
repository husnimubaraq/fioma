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
  GoogleMapController controller;

  final Set<Marker> _markers = {};
  Map<PolylineId, Polyline> polylines = <PolylineId, Polyline>{};

  LatLng initPosition;

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

        final icon = await BitmapDescriptorHelper.getClusterMarker(
            (i + 1), Colors.blueAccent, Colors.white, 50);

        final Marker marker = Marker(
            markerId: MarkerId(paths.pathInfo[i]),
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
          _markers.add(marker);
          polylines[polylineId] = polyline;
        });
      }
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
            markers: _markers,
            polylines:
                polylines != null ? Set<Polyline>.of(polylines.values) : null,
            onMapCreated: (controller) => _onMapCreated(controller),
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
      ],
    );
  }
}
