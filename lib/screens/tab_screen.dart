import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/screens/categories_screen.dart';
import 'package:meals_app/screens/favourites_screen.dart';
import 'package:meals_app/widgets/drawer.dart';

// class TabsScreen extends StatefulWidget {
//   const TabsScreen({super.key});

//   @override
//   State<TabsScreen> createState() => _TabsScreenState();
// }

// class _TabsScreenState extends State<TabsScreen> {
//   final List<Widget> _pages = [
//     CategoriesScreen(),
//     FavouritesScreen(),
//   ];

//   void _selectPage(int index) {
//     setState(() {
//       _selectPageIndex = index;
//     });
//   }

//   int _selectPageIndex = 0;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           'YumYum!',
//           style: TextStyle(
//             color: Colors.white,
//           ),
//         ),
//       ),
//       body: _pages[_selectPageIndex],
//       bottomNavigationBar: BottomNavigationBar(
//         onTap: _selectPage,
//         backgroundColor: Theme.of(context).primaryColor,
//         items: [
//           BottomNavigationBarItem(
//             icon: Icon(Icons.category),
//             label: 'category'
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.star),
//             label: 'favorite'
//           ),
//         ],
//       ),
//     );
//   }
// }

class TabsScreen extends StatefulWidget {
  final List<Meal> favoriteMeal;

  TabsScreen(this.favoriteMeal);
  
  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  final List<Map<String, dynamic>> _pages = [
    {'title': 'Categories'},
    {'title': 'Favourites'}
  ];

  int _selectPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(_pages[_selectPageIndex]['title']),
        ),
        drawer: DrawerItem(),
        body: TabBarView(
          children: [
            CategoriesScreen(),
            FavouritesScreen(widget.favoriteMeal),
          ],
        ),
        bottomNavigationBar: Container(
          color: Theme.of(context).colorScheme.primary,
          child: TabBar(
            onTap: _selectPage,
            //labelColor: Theme.of(context).colorScheme.secondary,
            indicatorColor: Theme.of(context).colorScheme.secondary,
            indicatorWeight: 3,
            tabs: [
              Tab(
                icon: Icon(
                  Icons.category,
                ),
                text: 'categories',
              ),
              Tab(
                icon: Icon(Icons.star),
                text: 'favourites',
              ),
            ],
            indicatorSize: TabBarIndicatorSize.label,
            indicatorPadding: EdgeInsets.all(5),
          ),
        ),
      ),
    );
  }
}
