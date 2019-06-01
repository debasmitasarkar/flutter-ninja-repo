import 'package:flutter/material.dart';
import 'package:globant_flutter_ninja/pages/search_screen.dart';
import 'package:globant_flutter_ninja/pages/user_profile_screen.dart';

import 'categories_screen.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Function> _pages;

  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _pages = [_buildCategoriesScreen, _buildProfileScreen];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.category,
              ),
              title: Text("Category")),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.account_circle,
              ),
              title: Text("Profile")),
        ],
        currentIndex: _selectedIndex,
        onTap: (val) {
          setState(() {
            _selectedIndex = val;
          });
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => SearchScreen()));
        },
        backgroundColor: Theme.of(context).primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Icon(Icons.search,),
      ),
      body: _pages[_selectedIndex](),
      backgroundColor: Colors.white,
    );
  }

  Widget _buildCategoriesScreen() {
    return CategoriesScreen(
        onProfileTap: () {
          setState(() {
            _selectedIndex = 1;
          });
        }
    );
  }

  Widget _buildProfileScreen() {
    return UserProfileScreen();
  }

  Widget _buildSearchScreen() {
    return SearchScreen();
  }
}
