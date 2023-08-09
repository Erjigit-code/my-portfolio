import 'package:exam_app/pages/cart_page/cart_page.dart';
import 'package:exam_app/pages/home-page/home_page.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';

import '../constants/constants.dart';
import '../providers/tab_provider.dart';

class BotmNavBar extends StatelessWidget {
  const BotmNavBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<TabProvider>(
      builder: (context, tabProvider, child) => Container(
        decoration: BoxDecoration(
            color: Colors.white,
            border:
                Border(top: BorderSide(color: Color(0xffE8E9EC), width: 1.0))),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Constants.whiteColor,
          showUnselectedLabels: true,
          unselectedItemColor: const Color(0xffA5A9B2),
          selectedItemColor: const Color(0xff3364E0),
          unselectedLabelStyle:
              const TextStyle(fontFamily: 'SFProDisplay', fontSize: 10),
          selectedLabelStyle:
              const TextStyle(fontFamily: 'SFProDisplay', fontSize: 10),
          iconSize: 25,
          elevation: 0,
          currentIndex: tabProvider.selectedTab,
          onTap: (value) {
            tabProvider.selectedTab = value;
            if (value == 0) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => MyHomePage()),
              );
            } else if (value == 2) {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => CartPage(
                          mealIndex: 0,
                        )),
              );
            }
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Iconsax.home),
              label: "Главная",
            ),
            BottomNavigationBarItem(
              icon: Icon(Iconsax.search_normal_14),
              label: "Поиск",
            ),
            BottomNavigationBarItem(
              icon: Icon(Iconsax.bag),
              label: "Корзина",
            ),
            BottomNavigationBarItem(
              icon: Icon(Iconsax.profile_circle),
              label: "Аккаунт",
            ),
          ],
        ),
      ),
    );
  }
}
