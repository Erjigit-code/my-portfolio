import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../constants/constants.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback onTapLocation;
  final String cityName;

  const CustomAppBar({
    super.key,
    required this.onTapLocation,
    required this.cityName,
  });
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    final DateTime now = DateTime.now();
    final DateFormat formatter = DateFormat.yMMMMd('ru_RU');
    final String formattedDate = formatter.format(now);
    return AppBar(
      automaticallyImplyLeading: false,
      elevation: 0,
      backgroundColor: Constants.whiteColor,
      title: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 5),
            child: Image.asset('assets/icons/location.png'),
          ),
          Container(
            margin: const EdgeInsets.only(left: 8.5),
            child: InkWell(
              onTap: onTapLocation,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    cityName.isEmpty ? 'Не удалось загрузить город' : cityName,
                    style: Constants.appBarText,
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(formattedDate, style: Constants.appbarText2),
                ],
              ),
            ),
          ),
        ],
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 9.0),
          child: Image.asset('assets/icons/picture-icon.png'),
        ),
      ],
    );
  }
}
