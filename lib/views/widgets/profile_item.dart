part of 'widget.dart';

class ProfileItem extends StatelessWidget {
  final String label;
  final String value;
  final bool isAddLineDivider;

  ProfileItem({this.label, this.value, this.isAddLineDivider = true});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: Themes.defaultMargin),
      alignment: Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: Themes.greyTextStyle,
          ),
          Text(
            value,
            style: Themes.blackTextStyle,
          ),
          isAddLineDivider
              ? Container(
                  margin: EdgeInsets.only(
                    top: 10,
                    bottom: 10,
                  ),
                  child: GeneralWidget.createLineDivider(
                      MediaQuery.of(context).size.width -
                          2 * Themes.defaultMargin),
                )
              : SizedBox()
        ],
      ),
    );
  }
}
