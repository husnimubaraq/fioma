part of 'pages.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ListView(
          children: [
            SizedBox(
              height: 80,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: Themes.defaultMargin),
              alignment: Alignment.centerLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Jenis User',
                    style: Themes.greyTextStyle,
                  ),
                  Text(
                    'Admin FIOMA',
                    style: Themes.blackTextStyle,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: Themes.defaultMargin),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Regional',
                        style: Themes.greyTextStyle,
                      ),
                      Text(
                        'Regional 4',
                        style: Themes.blackTextStyle,
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        'Arnet',
                        style: Themes.greyTextStyle,
                      ),
                      Text(
                        'Magelang',
                        style: Themes.blackTextStyle,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                top: 20,
                bottom: 20,
              ),
              child: GeneralWidget.createLineDivider(
                  MediaQuery.of(context).size.width),
            ),
            Padding(
              padding: EdgeInsets.only(left: Themes.defaultMargin),
              child: Text(
                'Menu',
                style: Themes.subTitleTextStyle.copyWith(
                    color: Themes.blackColor,
                    fontWeight: Themes.boldFontWeight),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: Themes.defaultMargin),
              child: Column(
                children: [
                  MenuCard(
                    imageUrl: 'assets/images/icon_kabel_fo.png',
                    title: 'Kabel FO',
                    totalData: 20,
                  ),
                ],
              ),
            ),
          ],
        ),
        Container(
            height: 70,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: Themes.primaryColor,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20))),
            padding: EdgeInsets.fromLTRB(
                Themes.defaultMargin, 20, Themes.defaultMargin, 15),
            child: SizedBox(
              width:
                  MediaQuery.of(context).size.width - 2 * Themes.defaultMargin,
              child: Text(
                "Hai, Joseph Carlo!",
                style: Themes.headerTextStyle,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            )),
      ],
    );
  }
}
