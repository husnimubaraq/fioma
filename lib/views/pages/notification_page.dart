part of 'pages.dart';

class NotificationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _NotificationPage();
  }
}

class _NotificationPage extends StatefulWidget {
  @override
  _NotificationState createState() => _NotificationState();
}

class _NotificationState extends State<_NotificationPage> {
  final NotificationController _controller =
      Get.put(NotificationController(Get.put(NotificationServices())));

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
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
            child: Obx(
          () => LazyLoadScrollView(
              onEndOfPage: _controller.loadNextPage,
              isLoading: _controller.lastPage,
              child: RefreshIndicator(
                  child: ListView.builder(
                      itemCount: _controller.notifications.length,
                      itemBuilder: (context, index) {
                        final notifications = _controller.notifications[index];

                        return NotificationCard(notification: notifications);
                      }),
                  onRefresh: onRefresh)),
        ))
      ],
    );
  }

  Future onRefresh() async {
    await Future.delayed(Duration(seconds: 2));
    _controller.reset();
  }
}
