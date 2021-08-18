part of 'widget.dart';

class KabelFoCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(KabelFoDetail());
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
            border:
                Border(bottom: BorderSide(color: Colors.grey[400], width: 1))),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Container(
                height: 65,
                width: 65,
                color: Themes.primaryColor,
                child: Center(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "20",
                      style: Themes.whiteTextStyle.copyWith(
                          fontWeight: Themes.boldFontWeight,
                          fontSize: Themes.subtitleFontSize),
                    ),
                    Text(
                      "core",
                      style: Themes.whiteTextStyle.copyWith(
                          fontWeight: Themes.lightFontWeight,
                          fontSize: Themes.lightFontSize),
                    )
                  ],
                )),
              ),
            ),
            SizedBox(
              width: 15,
            ),
            Container(
              width: (MediaQuery.of(context).size.width -
                      (2 * Themes.defaultMargin)) -
                  80,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("Magelang - Metroyudan",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Themes.blackTextStyle.copyWith(
                          fontWeight: ("unread" == 'unread'
                              ? Themes.mediumFontWeight
                              : Themes.regularFontWeight))),
                  Text.rich(TextSpan(
                      text: 'Ruas ',
                      style: Themes.blackTextStyle.copyWith(fontSize: 14),
                      children: [
                        TextSpan(
                            text: ' MTD_MGL_1',
                            style: Themes.blackTextStyle.copyWith(
                                fontSize: 14,
                                color: Themes.infoColor,
                                fontWeight: Themes.boldFontWeight))
                      ])),
                  Text(
                    "Regional 4 / Magelang",
                    style: Themes.greyTextStyle.copyWith(
                      fontSize: Themes.lightFontSize,
                      fontWeight: Themes.regularFontWeight,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
