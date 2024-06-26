import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import '../../model/const/image_name.dart';
import '../album/album_screen.dart';
import '../homescreen/homescreen.dart';

class MyBottomNavigationBar extends StatefulWidget {
  const MyBottomNavigationBar({super.key});

  @override
  State<MyBottomNavigationBar> createState() => _MyBottomNavigationBarState();
}

class _MyBottomNavigationBarState extends State<MyBottomNavigationBar> {
  int _selectedIndex = 0;

  late List<Widget> _widgetOptions;

  @override
  void initState() {
    super.initState();

    _widgetOptions = <Widget>[
      HomeScreen(),
      AlbumScreen(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              color: Colors.black12,
            )
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
            child: GNav(
              selectedIndex: _selectedIndex,
              onTabChange: _onItemTapped,
              tabs: [
                _buildGButton(
                  index: 0,
                  selectedIcon: AppIcons.home,
                  nonSelectedIcon: AppIcons.homeOutlined,
                  label: 'Home',
                ),
                _buildGButton(
                  index: 2,
                  selectedIcon: AppIcons.newspaper,
                  nonSelectedIcon: AppIcons.newspaperOutlined,
                  label: 'My Slot',
                ),
                // _buildGButton(
                //   index: 3,
                //   selectedIcon: AppIcons.user,
                //   nonSelectedIcon: AppIcons.userOutlined,
                //   label: 'Profile',
                // ),
              ],
              gap: 4,
              color: Colors.grey[800]!,
              activeColor: Colors.black,
              iconSize: 24,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              duration: const Duration(milliseconds: 800),
              tabBackgroundColor: Colors.grey[100]!,
            ),
          ),
        ),
      ),
    );
  }

  GButton _buildGButton({
    required String selectedIcon,
    required String nonSelectedIcon,
    required String label,
    required int index,
  }) {
    bool isSelected = index == _selectedIndex;
    return GButton(
      icon: Icons.abc,
      leading: SvgPicture.asset(
        isSelected ? selectedIcon : nonSelectedIcon,
        width: 24,
        height: 24,
        color: Colors.black,
      ),
      text: label,
      textColor: Colors.black,
      backgroundColor: Colors.transparent,
      hoverColor: Colors.transparent,
      rippleColor: Colors.transparent,
      border: isSelected
          ? Border.all(color: Colors.black, width: 2)
          : Border.all(color: Colors.transparent),
      onPressed: isSelected ? null : () => _onItemTapped(index),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
