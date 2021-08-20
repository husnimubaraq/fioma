part of 'pages.dart';

class ProfilePage extends StatelessWidget {
  final _controller = Get.put(ProfileController());
  @override
  Widget build(BuildContext context) {
    return Container(
      //padding: EdgeInsets.symmetric(horizontal: Themes.defaultMargin),
      child: ListView(
        children: [
          Column(
            children: [
              SizedBox(
                height: 50,
              ),
              CircleAvatar(
                radius: 40,
                backgroundColor: Themes.primaryColor,
                child: Icon(
                  Icons.person,
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
                  _controller.user.name,
                  maxLines: 2,
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.clip,
                  style: Themes.titleTextStyle,
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width -
                    2 * Themes.defaultMargin,
                margin: EdgeInsets.only(top: 8, bottom: 30),
                child: Text(
                  _controller.user.position,
                  textAlign: TextAlign.center,
                  style: Themes.subTitleTextStyle,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              ProfileItem(
                label: 'Username',
                value: _controller.user.username,
              ),
              ProfileItem(label: 'Phone', value: _controller.user.phone),
              ProfileItem(
                label: 'Email',
                value: _controller.user.email,
              ),
              ProfileItem(
                label: 'NIK',
                value: _controller.user.nik,
              ),
              ProfileItem(
                label: 'Posisi',
                value: _controller.user.type,
              ),
              ProfileItem(
                label: 'Regional',
                value: _controller.user.regionalName,
              ),
              ProfileItem(
                label: 'Arnet',
                value: _controller.user.arnetName,
                isAddLineDivider: false,
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                width: 300,
                margin: EdgeInsets.only(top: 24),
                height: 45,
                padding: EdgeInsets.symmetric(horizontal: Themes.defaultMargin),
                child: RaisedButton(
                  onPressed: () {
                    _controller.logout();
                  },
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  color: Themes.dangerColor,
                  child: Text("Sign Out", style: Themes.whiteTextStyle),
                ),
              ),
              SizedBox(
                height: 100,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
