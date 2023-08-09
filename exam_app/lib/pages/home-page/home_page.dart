import 'package:exam_app/constants/constants.dart';
import 'package:exam_app/pages/appbar.dart';

import 'package:exam_app/repositories/api/api_service.dart';
import 'package:exam_app/repositories/location_utils.dart';
import 'package:flutter/material.dart';

import '../../bars/nav_bottom_bar.dart';
import 'home_body.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<dynamic> data = [];
  String cityName = '';

  @override
  void initState() {
    super.initState();

    needLocation();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  void handleLocation(String cityName) {
    setState(() {
      this.cityName = cityName;
    });
  }

  void needLocation() {
    getLocation((cityName) {
      handleLocation(cityName);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.whiteColor,
      appBar: CustomAppBar(
        onTapLocation: () {
          handleLocation;
        },
        cityName: cityName,
      ),
      body: FutureBuilder<List>(
        future: CategoryMealsApi().fetchData(),
        builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return const Center(
              child: Text('Error loading data'),
            );
          } else {
            final data = snapshot.data ?? [];
            return HomeBody(data: data);
          }
        },
      ),
      bottomNavigationBar: const BotmNavBar(),
    );
  }
}
