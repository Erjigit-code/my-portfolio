import 'package:exam_app/pages/cart_page/cart_page.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../constants/constants.dart';

class addToCartDialog extends StatelessWidget {
  const addToCartDialog({
    super.key,
    required this.meals,
    required this.mealIndexx,
  });

  final Map<String, dynamic> meals;
  final int mealIndexx;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      insetPadding: EdgeInsets.zero,
      contentPadding: EdgeInsets.zero,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      content: Container(
        decoration: BoxDecoration(
            color: Constants.whiteColor,
            borderRadius: BorderRadius.circular(10)),
        width: MediaQuery.of(context).size.width * 0.9,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Stack(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 16),
                  height: 232,
                  width: MediaQuery.of(context).size.width * 0.8,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Constants.unselectedColor,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 17.0, top: 20),
                    child: Image.network(
                      meals['image_url'],
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                Positioned(
                  right: 8,
                  top: 24,
                  child: SizedBox(
                    width: 108,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              color: Constants.whiteColor,
                              borderRadius: BorderRadius.circular(10)),
                          child: IconButton(
                              splashRadius: 10,
                              onPressed: () {},
                              icon: Icon(
                                Iconsax.heart,
                                color: Constants.blackColor,
                              )),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: Constants.whiteColor,
                              borderRadius: BorderRadius.circular(10)),
                          child: IconButton(
                              splashRadius: 10,
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: Icon(
                                Icons.close_sharp,
                                color: Constants.blackColor,
                              )),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: SizedBox(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      meals['name'],
                      style: Constants.appBarText.copyWith(fontSize: 16),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Row(
                      children: [
                        Text(
                          '${meals['price']}₽',
                          style: Constants.tapbarText,
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Text(
                          '${meals['weight']}г',
                          style: Constants.tapbarText2,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      meals['description'],
                      style: Constants.appbarText2.copyWith(
                        color: Constants.blackColor.withOpacity(0.65),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      actions: [
        Align(
          alignment: Alignment.center,
          child: Container(
            // color: Color(0xff3364E0),
            margin: const EdgeInsets.only(bottom: 8, top: 8),
            width: MediaQuery.of(context).size.width * 0.8,
            height: 48,
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Color(0xff3364E0)),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(10), // Задайте нужный радиус
                  ),
                ),
              ),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return CartPage(mealIndex: mealIndexx);
                  },
                ));
              },
              child: const Text(
                'Добавить в корзину',
                style: Constants.buttonTxt,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
