part of 'pages.dart';

class KabelFoList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Themes.backgroundColor,
      body: SafeArea(
          child: Column(
        children: [
          Container(
            color: Themes.primaryColor,
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
                      color: Colors.white,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: Text(
                    "Kabel FO",
                    style: Themes.headerTextStyle,
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.fromLTRB(
                Themes.defaultMargin, 20, Themes.defaultMargin, 6),
            child: Text(
              "List Kabel FO",
              style: Themes.blackTextStyle,
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: Themes.defaultMargin),
            padding: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.black)),
            child: TextField(
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintStyle: Themes.greyTextStyle,
                  hintText: "Cari Kabel FO"),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: ListView(
              children: [
                KabelFoCard(),
                KabelFoCard(),
                KabelFoCard(),
                KabelFoCard(),
                KabelFoCard(),
                KabelFoCard(),
                KabelFoCard(),
                KabelFoCard(),
                KabelFoCard(),
                KabelFoCard(),
                KabelFoCard(),
                KabelFoCard(),
                KabelFoCard(),
                KabelFoCard(),
                KabelFoCard(),
                KabelFoCard(),
                KabelFoCard(),
                KabelFoCard(),
                KabelFoCard(),
                KabelFoCard(),
                KabelFoCard(),
                KabelFoCard(),
                KabelFoCard(),
              ],
            ),
          )
        ],
      )),
    );
  }
}
