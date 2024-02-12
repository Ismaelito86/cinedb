import 'package:cinedb/presentation/screens/maps_screen.dart';
import 'package:cinedb/presentation/screens/movies_screen.dart';
import 'package:cinedb/presentation/screens/profile_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    final viewRoutes = <Widget>[
      MovieScreen(
        pageIndex: _selectedIndex,
      ),
      ProfileScreen(
        pageIndex: _selectedIndex,
      ), // <--- categorias View
      MapsScreen(
        pageIndex: _selectedIndex,
      ),
    ];

    return Scaffold(
      body: viewRoutes.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Cinedb',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.maps_home_work_rounded),
            label: 'Maps',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: (index) => setState(() {
          _selectedIndex = index;
        }),
      ),
    );
  }
}
