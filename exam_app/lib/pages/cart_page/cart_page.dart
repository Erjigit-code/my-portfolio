import 'package:exam_app/bars/nav_bottom_bar.dart';
import 'package:exam_app/constants/constants.dart';
import 'package:exam_app/pages/appbar.dart';

import 'package:flutter/material.dart';

import '../../repositories/api/api_service.dart';
import '../../repositories/location_utils.dart';

class CartPage extends StatefulWidget {
  final int mealIndex;

  const CartPage({Key? key, required this.mealIndex}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  Map<String, dynamic>? mealData;
  int _count = 1;
  String cityName = '';
  num bill = 0;
  bool isLoading = true;
  @override
  void initState() {
    super.initState();

    needLocation();
    fetchMealDetails();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void fetchMealDetails() {
    setState(() {
      isLoading = true;
    });
    MealsNamesApi().fetchData().then((meals) {
      if (widget.mealIndex >= 0 && widget.mealIndex < meals.length) {
        setState(() {
          mealData = meals[widget.mealIndex];
          bill = (mealData!['price'] as num).toDouble();
          isLoading = false;
        });
      }
    }).catchError((error) {
      setState(() {
        isLoading = false;
      });
    });
  }

  void handleLocation(String cityName) {
    if (mounted) {
      setState(() {
        this.cityName = cityName;
      });
    }
  }

  void needLocation() {
    getLocation((cityName) {
      handleLocation(cityName);
    });
  }

  void _decreaseCount() {
    if (mounted) {
      if (_count > 1) {
        setState(() {
          _count--;
          bill -= mealData!['price'];
        });
      } else {
        setState(() {
          _count--;
          bill -= mealData!['price'];
          mealData = null;
        });
      }
    }
  }

  void _increaseCount() {
    if (mounted) {
      setState(() {
        _count++;
        bill += mealData!['price'];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.whiteColor,
      appBar: CustomAppBar(
        cityName: cityName,
        onTapLocation: () {
          handleLocation(cityName);
        },
      ),
      bottomNavigationBar: const BotmNavBar(),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (mealData != null)
                  ListTile(
                    onTap: () {},
                    title: Text(mealData!['name']),
                    subtitle: Row(
                      children: [
                        Text(
                          '${mealData!['price']}₽',
                          style: Constants.tapbarText,
                        ),
                        SizedBox(
                          width: 7,
                        ),
                        Text(
                          '${mealData!['weight']}г',
                          style: Constants.tapbarText2,
                        ),
                      ],
                    ),
                    leading: Container(
                      width: 62,
                      height: 62,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Constants.unselectedColor,
                      ),
                      child: Image.network(
                        mealData!['image_url'],
                      ),
                    ),
                    trailing: Container(
                      width: 120, // Fixed width for the trailing widget
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            onPressed: _decreaseCount,
                            icon: Icon(
                              Icons.remove,
                              size: 18,
                              color: Constants.blackColor,
                            ),
                          ),
                          Text(
                            '$_count',
                            style: Constants.appBarText.copyWith(fontSize: 14),
                          ),
                          IconButton(
                            onPressed: _increaseCount,
                            icon: Icon(
                              Icons.add_sharp,
                              size: 18,
                              color: Constants.blackColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                _count >= 1
                    ? Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          margin: const EdgeInsets.only(bottom: 16),
                          width: MediaQuery.of(context).size.width * 0.9,
                          height: 48,
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStatePropertyAll(Color(0xff3364E0)),
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                            child: Text(
                              'Оплатить  $bill₽',
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                        ),
                      )
                    : Center(
                        child: Text(
                        'Нет Блюд',
                        style: Constants.appBarText,
                      ))
              ],
            ),
    );
  }
}
