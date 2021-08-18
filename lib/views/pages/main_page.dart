part of 'pages.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  PageController pageController;
  int lastBottomNavBarIndex;
  int bottomNavBarIndex;

  @override
  void initState() {
    super.initState();
    lastBottomNavBarIndex = 0;
    bottomNavBarIndex = 0;
    pageController = PageController(initialPage: bottomNavBarIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SafeArea(
            child: Container(
              color: Themes.backgroundColor,
            ),
          ),
          SafeArea(
            child: PageView(
              //physics: NeverScrollableScrollPhysics(),
              controller: pageController,
              onPageChanged: (index) {
                setState(() {
                  lastBottomNavBarIndex = bottomNavBarIndex;
                  bottomNavBarIndex = index;
                  //pageController.jumpToPage(index);
                });
              },
              children: <Widget>[
                HomePage(),
                NotificationPage(),
                ProfilePage(),
              ],
            ),
          ),
          createCustomBottomNavBar()
        ],
      ),
    );
  }

  Widget createCustomBottomNavBar() => Align(
        alignment: Alignment.bottomCenter,
        child: Container(
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20))),
            child: BottomNavigationBar(
              elevation: 0,
              backgroundColor: Colors.transparent,
              selectedItemColor: Themes.primaryColor,
              unselectedItemColor: Colors.grey,
              currentIndex: bottomNavBarIndex,
              onTap: (index) {
                setState(() {
                  lastBottomNavBarIndex = bottomNavBarIndex;
                  bottomNavBarIndex = index;
                  pageController.jumpToPage(index);
                });
              },
              type: BottomNavigationBarType.fixed,
              items: [
                BottomNavigationBarItem(
                  label: "Home",
                  icon: Container(
                      margin: EdgeInsets.only(bottom: 6),
                      height: 20,
                      child: Icon(MdiIcons.compass)),
                ),
                BottomNavigationBarItem(
                  label: "Notification",
                  icon: Container(
                      margin: EdgeInsets.only(bottom: 6),
                      height: 20,
                      child: Icon(Icons.notifications_active)),
                ),
                BottomNavigationBarItem(
                  label: "Profile",
                  icon: Container(
                      margin: EdgeInsets.only(bottom: 6),
                      height: 20,
                      child: Icon(Icons.account_circle)),
                ),
              ],
            )),
      );
}
