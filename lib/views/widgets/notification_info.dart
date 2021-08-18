part of 'widget.dart';

class NotificationIfo extends StatelessWidget {
  String label;
  String value;

  NotificationIfo({this.label, this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "halo",
          style: Themes.greyTextStyle.copyWith(fontSize: 16),
        ),
        SizedBox(
          height: 8,
        ),
        Text(
          "halo",
          style: Themes.blackTextStyle.copyWith(fontSize: 16),
        ),
      ],
    );
  }
}
