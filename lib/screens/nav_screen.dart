import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_mobile_web/cubits/cubits.dart';
import 'package:netflix_mobile_web/screens/screens.dart';

class NavScreen extends StatefulWidget {
  @override
  _NavScreenState createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> {
  final List<Widget> _screen = [
    HomeScreen(key: PageStorageKey('homeScreen')),
    Scaffold(),
    Scaffold(),
    Scaffold(),
    Scaffold()
  ];
  final Map<String, IconData> _icons = const {
    'Home': Icons.home,
    'Search': Icons.search,
    'Coming soon': Icons.queue_play_next,
    'Downloads': Icons.file_download,
    'More': Icons.menu
  };
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<AppBarCubit>(
          create: (context) => AppBarCubit(), child: _screen[_currentIndex]),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.black,
        items: _icons
            .map((title, icon) => MapEntry(
                title,
                BottomNavigationBarItem(
                    icon: Icon(
                      icon,
                      size: 25,
                    ),
                    title: Text(title))))
            .values
            .toList(),
        currentIndex: _currentIndex,
        selectedItemColor: Colors.white,
        selectedFontSize: 9,
        unselectedItemColor: Colors.grey,
        unselectedFontSize: 9,
        onTap: (index) => setState(() => _currentIndex = index),
      ),
    );
  }
}
