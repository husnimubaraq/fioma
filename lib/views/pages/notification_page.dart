part of 'pages.dart';

class NotificationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //note: BAGIAN HEADER
        Container(
          color: Themes.primaryColor,
          height: 70,
          padding: EdgeInsets.only(
              top: 20, left: Themes.defaultMargin, right: 20, bottom: 15),
          child: Align(
            alignment: Alignment.topCenter,
            child: Text(
              "Notification",
              style: Themes.headerTextStyle,
            ),
          ),
        ),
        Expanded(
          child: ListView(
            children: [
              NotificationCard(),
              NotificationCard(),
              NotificationCard(),
              NotificationCard(),
              NotificationCard(),
              NotificationCard(),
              NotificationCard(),
              NotificationCard(),
              NotificationCard(),
              NotificationCard(),
              NotificationCard(),
              NotificationCard(),
              NotificationCard(),
              NotificationCard(),
              NotificationCard(),
            ],
          ),
        ),
      ],
    );
  }
}
