import 'package:custom_line_indicator_bottom_navbar/custom_line_indicator_bottom_navbar.dart';
import 'package:flutter/material.dart';
import 'package:roof_up/saved/saved_page.dart';

import 'home/home_page.dart';
import 'more/more_page.dart';
import 'notifications/notifications_page.dart';


class NavPage extends StatefulWidget {
  const NavPage({super.key});

  @override
  State<NavPage> createState() => _NavPageState();
}

class _NavPageState extends State<NavPage> {

  int _selectedIndex = 0; //default index

  List<Widget> _widgetOptions = [
    HomePage(),
    Saved(),
    Notifications(),
    More(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: CustomLineIndicatorBottomNavbar(
        selectedColor: Colors.blue.shade800,
        unSelectedColor: Colors.black54,
        backgroundColor: Colors.white,
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        enableLineIndicator: true,
        lineIndicatorWidth: 3,
        indicatorType: IndicatorType.Top,
        selectedIconSize: 20,
        selectedFontSize: 12,
        unselectedIconSize: 20,
        unselectedFontSize: 12,

        customBottomBarItems: [
          CustomBottomBarItems(
            label: 'Home',
            icon: _selectedIndex == 0? Icons.home : Icons.home_outlined,
          ),
          CustomBottomBarItems(
            label: 'Saved',
            icon: _selectedIndex == 1?Icons.favorite:Icons.favorite_outline_rounded,
          ),
          CustomBottomBarItems(
            label: 'Notifications',
            icon: _selectedIndex == 2 ? Icons.notifications : Icons.notifications_outlined,
          ),
          CustomBottomBarItems(
            label: 'More',
            icon: _selectedIndex == 3 ? Icons.more_horiz : Icons.more_horiz_outlined,
          ),
        ],
      ),
    );
  }
}
