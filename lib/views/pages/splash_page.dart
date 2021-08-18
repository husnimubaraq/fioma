part of 'pages.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Themes.primaryColor,
        body: SafeArea(
            child: Center(
          child: Image.asset(
            'assets/images/logo.png',
            width: 200,
          ),
        )));
  }
}
