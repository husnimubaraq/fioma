part of 'pages.dart';

class NotificationDetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Themes.backgroundColor,
      body: SafeArea(
        child: ListView(
          children: [
            Column(
              children: [
                Container(
                  color: Themes.primaryColor,
                  height: 70,
                  padding: EdgeInsets.only(
                      top: 20,
                      left: Themes.defaultMargin,
                      right: 20,
                      bottom: 15),
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
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.topCenter,
                        child: Text(
                          "Detail Notification",
                          style: Themes.headerTextStyle,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 25, bottom: 10),
                  width: 60,
                  height: 60,
                  child: Icon(
                    MdiIcons.messageAlertOutline,
                    color: Themes.primaryColor,
                    size: 60,
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width -
                      2 * Themes.defaultMargin,
                  child: Text(
                    "CRITICAL",
                    maxLines: 2,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.clip,
                    style: Themes.subTitleTextStyle.copyWith(
                        color: Themes.dangerColor,
                        fontWeight: Themes.boldFontWeight),
                  ),
                ),
                SizedBox(
                  height: 35,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width -
                      2 * Themes.defaultMargin,
                  child: Text("Judul Berita",
                      textAlign: TextAlign.left,
                      style: Themes.blackTextStyle.copyWith(
                          fontSize: Themes.subtitleFontSize,
                          fontWeight: Themes.boldFontWeight)),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  width: MediaQuery.of(context).size.width -
                      2 * Themes.defaultMargin,
                  child: Text("20 July 2020, 13:20",
                      textAlign: TextAlign.left, style: Themes.greyTextStyle),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width -
                      2 * Themes.defaultMargin,
                  child: Text(
                      "Body nya adalah saya makan nasi dan ikan di tengah jalan lalau saya muntah.. kira2 bgtu",
                      textAlign: TextAlign.justify,
                      style: Themes.blackTextStyle),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
