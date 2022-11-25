import 'package:flutter/material.dart';
import 'package:seller_app/homescreen/homescree.dart';
import 'package:seller_app/profilescreen/view/profilescreen.dart';
import 'package:seller_app/vieworders/vieworders.dart';
import 'package:seller_app/viewproduct/viewproduct.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _selectedIndex = 0;

  void onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _widgets = [
    HomeScreen(),
    const Viewproduct(),
    const Vieworders(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    // print(_widgets.elementAt(_selectedIndex));
    return Scaffold(
      // drawer: const CustomeDrawer(),
      appBar: AppBar(
        elevation: 0,
        brightness: Brightness.dark,
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        title: Image.network(
            'https://s3u.tmimgcdn.com/1660587-1529074811857_2.jpg'),
        actions: const [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: Icon(
              Icons.search,
              color: Colors.black,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: Icon(
              Icons.shopping_bag_outlined,
              color: Colors.black,
            ),
          )
        ],
      ),
      body: _widgets[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
              ),
              label: 'Home',
              backgroundColor: Colors.black),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.category,
              ),
              label: 'view product',
              backgroundColor: Colors.black),
          BottomNavigationBarItem(
              icon: Icon(Icons.notifications),
              label: 'view orders',
              backgroundColor: Colors.black),
          BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Account',
              backgroundColor: Colors.black),
        ],
        currentIndex: _selectedIndex,
        onTap: onItemTapped,
      ),
    );
  }
}
