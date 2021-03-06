import 'package:flutter/material.dart';
import 'package:fooder_app/components/card2.dart';
import 'package:fooder_app/components/card3.dart';
import 'package:fooder_app/screens/explore_screen.dart';
import 'package:fooder_app/screens/grocery_screen.dart';
import 'package:fooder_app/screens/recipes_screens.dart';
import 'package:provider/provider.dart';

import 'components/card1.dart';
import 'models/models.dart';


class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;

  static List<Widget> pages = <Widget>[
    ExploreScreen(),
    RecipesScreen(),
    GroceryScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Consumer<TabManager>(builder: (context, tabManager, child) {
      return Scaffold(
        appBar: AppBar(
          title: Text(
            'Fooderlich',
            style: Theme.of(context).textTheme.headline6,
          ),
          centerTitle: true,
        ),
        body:  IndexedStack(index: tabManager.selectedTab, children: pages,),
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Theme.of(context).textSelectionTheme.selectionColor,

          currentIndex: tabManager.selectedTab,
          onTap: (index) {
            tabManager.goTab(index);
          },
          items: const <BottomNavigationBarItem>[
             BottomNavigationBarItem(
              icon: Icon(Icons.explore),
              label: 'Explore',
            ),

             BottomNavigationBarItem(
              icon: Icon(Icons.book),
              label: 'recipes',
            ),

             BottomNavigationBarItem(
              icon: Icon(Icons.list),
              label: 'To Buy'
            ),
          ],
        ),
      );
    });
  }
}
