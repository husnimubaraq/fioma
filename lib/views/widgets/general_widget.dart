part of 'widget.dart';

class GeneralWidget {
  static Widget createDashedDivider(double width) {
    int n = width ~/ 5;
    return Row(
      children: List.generate(
          n,
          (index) => (index % 2 == 0)
              ? Container(
                  height: 2,
                  width: width / n,
                  color: Themes.greyColor,
                )
              : SizedBox(
                  width: width / n,
                )),
    );
  }

  static Widget createLineDivider(double width) {
    int n = width ~/ 5;
    return Row(
      children: List.generate(
          n,
          (index) => Container(
                height: 2,
                width: width / n,
                color: Themes.softGreyColor,
              )),
    );
  }
}
