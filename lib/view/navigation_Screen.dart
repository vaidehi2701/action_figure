import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:action_figure/utils/constants.dart';
import 'package:action_figure/view/bag/bag_screen.dart';
import 'package:action_figure/view/home/home_screen.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _NavigationScreenState createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  final PageController _pageController = PageController();

  int _selectedIndex = 0;
  final List<Widget> _screen = [
    const HomeScreen(),
    const MyBagScreen(),
  ];

  void _onPageChanged(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onItemTapped(int selectedIndex) {
    _pageController.jumpToPage(selectedIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: _onPageChanged,
        physics: const NeverScrollableScrollPhysics(),
        children: _screen,
      ),
      bottomNavigationBar: CustomNavigationBar(
        iconSize: 27.0,
        bubbleCurve: Curves.linear,
        selectedColor: AppConstantsColor.materialButtonColor,
        strokeColor: AppConstantsColor.materialButtonColor,
        unSelectedColor: const Color(0xffacacac),
        backgroundColor: Colors.white,
        scaleFactor: 0.1,
        items: [
          CustomNavigationBarItem(
            icon: const Icon(CupertinoIcons.house_alt_fill),
          ),
          CustomNavigationBarItem(
            icon: const Icon(CupertinoIcons.cart_fill),
          ),
        ],
        onTap: _onItemTapped,
        currentIndex: _selectedIndex,
      ),
    );
  }
}
