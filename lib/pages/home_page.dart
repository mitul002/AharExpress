
import 'package:first_app/components/my_description_box.dart';
import 'package:first_app/components/my_food_tile.dart';
import 'package:first_app/components/my_tab_bar.dart';
import 'package:first_app/model/food.dart';
import 'package:first_app/model/restaurant.dart';
import 'package:first_app/pages/food_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/my_drawer.dart';
import 'package:first_app/components/my_silver_app_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {

  //tab Controller
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: FoodCategory.values.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  //item sort kore menu te dekhabe
  List<Food> _filterMenuCategory(FoodCategory category, List<Food> fullMenu) {
    return fullMenu.where((food) => food.category == category).toList();
  }


  // category wise food dekhabe
  List<Widget> getFoodInThisCategory(List<Food> fullMenu) {
    return FoodCategory.values.map((category) {
      //get category menu
      List<Food> categoryMenu = _filterMenuCategory(category, fullMenu);

      return ListView.builder(
        itemCount: categoryMenu.length,
        physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.zero,
        itemBuilder: (context, index) {
          //get individual food
          final food = categoryMenu[index];

          //foodpage e jabe
          return FoodTile(
              food: food,
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => FoodPage(food: food),
                ),
              ),
          );
        },
      );
    }).toList();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxScrolled) => [
          MySliverAppBar(
            title: MyTabBar(tabController: _tabController),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Divider(
                  indent: 25,
                  endIndent: 25,
                  color: Theme.of(context).colorScheme.secondary,
                ),

            

                //description box
                MyDescriptionBox(),
              ],
            ),
            ),
          ],
          body: Consumer<Restaurant>(
              builder: (context, restaurant, child) => TabBarView(
                controller: _tabController,
                children: getFoodInThisCategory(restaurant.menu),
              ),
         ),
      ),
    );
  }
}
