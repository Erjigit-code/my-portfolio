import 'package:exam_app/constants/constants.dart';

import 'package:flutter/material.dart';

import '../../bars/nav_bottom_bar.dart';
import '../../repositories/api/api_service.dart';
import 'dishes.dart';

class CategoryPage extends StatefulWidget {
  final String categoryName;
  const CategoryPage({super.key, required this.categoryName});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  List<String> tags = ['Все меню', 'С рыбой', 'Салаты', 'С рисом'];
  bool slct = false;
  String selectedTag = "Все меню";
  List<Map<String, dynamic>> filteredDishes = [];

  List<dynamic> data2 = [];

  void _onTagSelected(String tag) {
    setState(() {
      selectedTag = tag;
      filterDishesByTag(selectedTag);
    });
  }

  void filterDishesByTag(String tag) {
    if (tag == "Все меню") {
      filteredDishes = List.from(data2);
    } else {
      filteredDishes = data2
          .where((dish) => dish["tegs"].contains(tag))
          .toList()
          .cast<Map<String, dynamic>>();
    }
  }

  @override
  void initState() {
    super.initState();

    _tabController = TabController(length: tags.length, vsync: this);
    _tabController.addListener(() {
      if (_tabController.indexIsChanging) {
        setState(() {
          selectedTag = tags[_tabController.index];
          filterDishesByTag(selectedTag);
        });
      }
    });

    MealsNamesApi().fetchData().then((value) {
      setState(() {
        data2 = value;
        filterDishesByTag(selectedTag);
      });
    });
  }

  @override
  void dispose() {
    _tabController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tags.length,
      child: Scaffold(
          backgroundColor: Constants.whiteColor,
          appBar: _buildAppbarCategoryPage(context),
          body: FutureBuilder<List<dynamic>>(
              future: MealsNamesApi().fetchData(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (snapshot.hasError) {
                  return const Center(
                    child: Text('Error fetching data'),
                  );
                } else {
                  return Column(
                    children: [
                      const SizedBox(
                        height: 8,
                      ),
                      _buildChoicChip(),
                      const SizedBox(
                        height: 16,
                      ),
                      BuildDishes(filteredDishes: filteredDishes),
                    ],
                  );
                }
              }),
          bottomNavigationBar: const BotmNavBar()),
    );
  }

  AppBar _buildAppbarCategoryPage(BuildContext context) {
    return AppBar(
      backgroundColor: Constants.whiteColor,
      elevation: 0,
      automaticallyImplyLeading: false,
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back_ios_new_sharp,
          color: Constants.blackColor,
          size: 15,
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      title: Text(
        widget.categoryName,
        style: Constants.appBarText,
      ),
      centerTitle: true,
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 9.0),
          child: Image.asset('assets/icons/picture-icon.png'),
        )
      ],
    );
  }

  Container _buildChoicChip() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Wrap(
          spacing: 8,
          children: tags.map((tag) {
            final isSelected = selectedTag == tag;
            return ChoiceChip(
              labelPadding: const EdgeInsets.symmetric(horizontal: 16),
              selectedColor: Constants.selectedColor,
              label: Text(tag),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              backgroundColor: Constants.unselectedColor,
              labelStyle: isSelected
                  ? Constants.tapbarText.copyWith(color: Constants.whiteColor)
                  : Constants.tapbarText,
              selected: isSelected,
              onSelected: (selected) {
                _onTagSelected(tag);
              },
            );
          }).toList(),
        ),
      ),
    );
  }
}
