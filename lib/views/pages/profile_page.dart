part of 'pages.dart';

class ProfilePage extends StatelessWidget {
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
                  "Joseph Carlo",
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
                  'Admin FIOMA',
                  textAlign: TextAlign.center,
                  style: Themes.subTitleTextStyle,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              ProfileItem(
                label: 'Username',
                value: 'josephcarlo',
              ),
              ProfileItem(
                label: 'Phone',
                value: '085696811483',
              ),
              ProfileItem(
                label: 'Email',
                value: 'elslaq.kho@gmail.com',
              ),
              ProfileItem(
                label: 'NIK',
                value: '2113243535',
              ),
              ProfileItem(
                label: 'Posisi',
                value: 'OM Transport',
              ),
              ProfileItem(
                label: 'Regional',
                value: 'Regional 4',
              ),
              ProfileItem(
                label: 'Arnet',
                value: 'Magelang',
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
                  onPressed: () async {},
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
