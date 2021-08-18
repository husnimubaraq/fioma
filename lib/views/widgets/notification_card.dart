part of 'widget.dart';

class NotificationCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(NotificationDetailPage());
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
            border:
                Border(bottom: BorderSide(color: Colors.grey[400], width: 1))),
        child: Row(
          children: [
            Icon(
              MdiIcons.email,
              color: Themes.primaryColor,
            ),
            SizedBox(
              width: 20,
            ),
            Container(
              width: (MediaQuery.of(context).size.width - 40) * 7 / 8,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("Pesan Berantai",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Themes.blackTextStyle.copyWith(
                          fontWeight: ("unread" == 'unread'
                              ? Themes.boldFontWeight
                              : Themes.regularFontWeight))),
                  Text(
                    "halo apa kaabar saya makan nasi dan ikan",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Themes.blackTextStyle
                        .copyWith(fontSize: Themes.regularFontSize),
                  ),
                  Text(
                    "CRITICAL",
                    style: Themes.blackTextStyle.copyWith(
                        fontWeight: Themes.mediumFontWeight,
                        color: Themes.dangerColor),
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
