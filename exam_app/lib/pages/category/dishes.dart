import 'package:flutter/material.dart';

import '../../constants/constants.dart';
import 'add_to_cart.dart';

class BuildDishes extends StatelessWidget {
  const BuildDishes({
    super.key,
    required this.filteredDishes,
  });

  final List<Map<String, dynamic>> filteredDishes;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Align(
                alignment: Alignment.topLeft,
                child: Wrap(
                  spacing: 26,
                  runSpacing: 14,
                  children: List.generate(filteredDishes.length, (index) {
                    final meals = filteredDishes[index];
                    return InkWell(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) => addToCartDialog(
                            meals: meals,
                            mealIndexx: index,
                          ),
                        );
                      },
                      child: Column(
                        children: [
                          Container(
                            width: 109,
                            height: 109, // Ширина ячейки
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Constants.unselectedColor,
                            ),
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 4.0, top: 13),
                              child: Image.network(
                                meals['image_url'],
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          SizedBox(
                            width: 109,
                            child: Text(
                              meals['name'],
                              textAlign: TextAlign.left,
                              overflow: TextOverflow.visible,
                              style: Constants.appbarText2
                                  .copyWith(color: Constants.blackColor),
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
