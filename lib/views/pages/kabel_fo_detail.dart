part of 'pages.dart';

class KabelFoDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Themes.backgroundColor,
      body: SafeArea(
          child: ListView(
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
                    style: Themes.headerTextStyle
                        .copyWith(color: Themes.blackColor),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: Themes.defaultMargin),
            child: Column(
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
                    "Magelang - Metroyudan",
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
                    'MTD_MGL_1',
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
                informationItem("Regional", "Regional 4"),
                informationItem("Arnet", "Maegelang"),
                informationItem("STO", "MGL"),
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
                informationItem("Total Core", "40"),
                informationItem("Jenis FO", "G652"),
                informationItem("Jenis Kabel", "AERIAL"),
                informationItem("Panjang Kabel", "6.5"),
                informationItem("Panjang Kabel", "6.5"),
                informationItem("Pabrikan Kabel", "OLEX"),
                informationItem("Tahun Kabel", "1997"),
                informationItem("Mitra", "Tidak diketahui"),
                SizedBox(
                  height: 50,
                ),
                Container(
                  width: 300,
                  height: 45,
                  padding:
                      EdgeInsets.symmetric(horizontal: Themes.defaultMargin),
                  child: RaisedButton(
                    onPressed: () async {},
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
                    onPressed: () async {},
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    color: Themes.infoColor,
                    child: Text("Tambahkan Path", style: Themes.whiteTextStyle),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
              ],
            ),
          ),
        ],
      )),
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
