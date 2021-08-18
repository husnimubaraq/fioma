part of 'pages.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Column(
              children: [
                Container(
                  padding: EdgeInsets.all(Themes.defaultMargin),
                  width: double.infinity,
                  height: 110,
                  //color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Halo,", style: Themes.titleTextStyle),
                      Text("Selamat Datang!", style: Themes.subTitleTextStyle),
                    ],
                  ),
                ),
                Container(
                  width: 110,
                  height: 110,
                  margin: EdgeInsets.only(top: 26),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/photo_border.png'))),
                  child: CircleAvatar(
                    radius: 50,
                    backgroundColor: Themes.primaryColor,
                    child: Icon(
                      Icons.person,
                      color: Colors.white,
                      size: 60,
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.fromLTRB(
                      Themes.defaultMargin, 26, Themes.defaultMargin, 6),
                  child: Text(
                    "Email",
                    style: Themes.blackTextStyle,
                  ),
                ),
                Container(
                  width: double.infinity,
                  margin:
                      EdgeInsets.symmetric(horizontal: Themes.defaultMargin),
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.black)),
                  child: TextField(
                    controller: emailController,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintStyle: Themes.greyTextStyle,
                        hintText: "Masukan email"),
                  ),
                ),
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.fromLTRB(
                      Themes.defaultMargin, 16, Themes.defaultMargin, 6),
                  child: Text(
                    "Password",
                    style: Themes.blackTextStyle,
                  ),
                ),
                Container(
                  width: double.infinity,
                  margin:
                      EdgeInsets.symmetric(horizontal: Themes.defaultMargin),
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.black)),
                  child: TextField(
                    obscureText: true,
                    controller: passwordController,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintStyle: Themes.greyTextStyle,
                        hintText: "Masukan password"),
                  ),
                ),
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.only(top: 24),
                  height: 45,
                  padding:
                      EdgeInsets.symmetric(horizontal: Themes.defaultMargin),
                  child: RaisedButton(
                    onPressed: () {
                      Get.to(MainPage());
                    },
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    color: Themes.primaryColor,
                    child: Text("Sign In", style: Themes.whiteTextStyle),
                  ),
                ),
                SizedBox(
                  height: 20,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
