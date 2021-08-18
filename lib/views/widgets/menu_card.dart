part of 'widget.dart';

class MenuCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final int totalData;

  MenuCard({this.imageUrl, this.title, this.totalData});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(KabelFoList());
      },
      child: Row(
        children: [
          Image.asset(
            imageUrl,
            width: 80,
            height: 80,
          ),
          SizedBox(
            width: 16,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: Themes.blackTextStyle.copyWith(
                    fontSize: Themes.subtitleFontSize,
                    fontWeight: Themes.mediumFontWeight),
              ),
              SizedBox(
                height: 4,
              ),
              Text.rich(TextSpan(
                  text: 'Total Data : ',
                  style: Themes.greyTextStyle,
                  children: [
                    TextSpan(
                        text: totalData.toString(),
                        style: Themes.blackTextStyle
                            .copyWith(color: Themes.primaryColor))
                  ])),
            ],
          ),
          Spacer(),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.chevron_right,
              size: 30,
              color: Themes.greyColor,
            ),
          ),
        ],
      ),
    );
  }
}
