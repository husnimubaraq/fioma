part of 'pages.dart';

class KabelFoDetail extends StatelessWidget {
  final KabelFO kabelFO;

  KabelFoDetail({Key key, this.kabelFO}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Themes.backgroundColor,
      body: SafeArea(child: _KabelFoDetail(kabelFO)),
    );
  }
}

class _KabelFoDetail extends StatefulWidget {
  final KabelFO kabelFO;

  _KabelFoDetail(this.kabelFO);

  @override
  _KabelFoDetailState createState() => _KabelFoDetailState();
}

class _KabelFoDetailState extends State<_KabelFoDetail> {
  final KabelFoDetailController controller = Get.put(KabelFoDetailController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.init(widget.kabelFO);
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          color: Colors.transparent,
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
                  "Detail Kabel FO",
                  style:
                      Themes.headerTextStyle.copyWith(color: Themes.blackColor),
                ),
              ),
            ],
          ),
        ),
        Padding(
            padding: EdgeInsets.symmetric(horizontal: Themes.defaultMargin),
            child: Obx(() {
              return Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  CircleAvatar(
                    radius: 40,
                    backgroundColor: Themes.primaryColor,
                    child: Icon(
                      MdiIcons.mapLegend,
                      color: Colors.white,
                      size: 50,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width -
                        2 * Themes.defaultMargin,
                    child: Text(
                      controller.kabelFO.value.name,
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.clip,
                      style: Themes.titleTextStyle,
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width -
                        2 * Themes.defaultMargin,
                    margin: EdgeInsets.only(top: 8, bottom: 40),
                    child: Text(
                      controller.kabelFO.value.ruas,
                      textAlign: TextAlign.center,
                      style: Themes.subTitleTextStyle
                          .copyWith(fontWeight: Themes.boldFontWeight),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(top: 10, bottom: 10),
                      child: Text(
                        'Informasi Kepemilikan',
                        style: Themes.subTitleTextStyle
                            .copyWith(color: Themes.blackColor),
                      ),
                    ),
                  ),
                  informationItem(
                      "Regional", controller.kabelFO.value.regionalName),
                  informationItem("Arnet", controller.kabelFO.value.arnetName),
                  informationItem("STO", controller.kabelFO.value.stoName),
                  SizedBox(
                    height: 20,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(top: 10, bottom: 10),
                      child: Text(
                        'Informasi Detail',
                        style: Themes.subTitleTextStyle
                            .copyWith(color: Themes.blackColor),
                      ),
                    ),
                  ),
                  informationItem(
                      "Total Core", controller.kabelFO.value.totalCore),
                  informationItem("Jenis FO", controller.kabelFO.value.jenisFo),
                  informationItem(
                      "Jenis Kabel", controller.kabelFO.value.jenisKabel),
                  informationItem("Panjang Kabel",
                      "${controller.kabelFO.value.kabelPanjang}"),
                  informationItem(
                      "Pabrikan Kabel", controller.kabelFO.value.kabelPabrikan),
                  informationItem(
                      "Tahun Kabel", controller.kabelFO.value.kabelTahun),
                  informationItem(
                      "Mitra", controller.kabelFO.value.mitraPelaksana),
                  SizedBox(
                    height: 50,
                  ),
                  Container(
                    width: 300,
                    height: 45,
                    padding:
                        EdgeInsets.symmetric(horizontal: Themes.defaultMargin),
                    child: RaisedButton(
                      onPressed: () async {
                        Get.to(MapView(
                          dataPath: controller.kabelFO.value.data,
                        ));
                      },
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                      color: Themes.warningColor,
                      child: Text("Lihat Peta", style: Themes.whiteTextStyle),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: 300,
                    height: 45,
                    padding:
                        EdgeInsets.symmetric(horizontal: Themes.defaultMargin),
                    child: RaisedButton(
                      onPressed: () async {
                        Get.to(MapAdd(
                          dataPath: controller.kabelFO.value.data,
                          id: controller.kabelFO.value.id,
                        ));
                      },
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                      color: Themes.infoColor,
                      child:
                          Text("Tambahkan Path", style: Themes.whiteTextStyle),
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                ],
              );
            })),
      ],
    );
  }
}

Widget informationItem(String key, String value) {
  return Padding(
    padding: EdgeInsets.only(bottom: 6),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          key,
          style: Themes.greyTextStyle,
        ),
        SizedBox(
          width: 10,
        ),
        Text(
          value,
          style: Themes.blackTextStyle,
          textAlign: TextAlign.right,
        )
      ],
    ),
  );
}
