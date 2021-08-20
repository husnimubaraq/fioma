part of 'widget.dart';

class NotificationCard extends StatelessWidget {
  ListElement notification;

  NotificationCard({Key key, this.notification}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // var data = jsonDecode(notification.data);
    return InkWell(
      onTap: () {
        Get.to(NotificationDetailPage(
          id: notification.id,
        ));
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
            Container(
              width: (MediaQuery.of(context).size.width - 40) * 7 / 8,
              padding: const EdgeInsets.only(left: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(notification.title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Themes.blackTextStyle.copyWith(
                          fontWeight: (notification.data == null
                              ? Themes.boldFontWeight
                              : Themes.regularFontWeight))),
                  Text(
                    notification.content ?? "",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Themes.blackTextStyle
                        .copyWith(fontSize: Themes.regularFontSize),
                  ),
                  Text(
                    notification.category,
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
