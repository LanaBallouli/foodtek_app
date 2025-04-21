import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:foodtek/app_constants.dart';

class MainBottomNavigationBar extends StatelessWidget {
  final int activeIndex;
  final Function(int) onTabTapped;

  const MainBottomNavigationBar({
    Key? key,
    required this.activeIndex,
    required this.onTabTapped,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;
    return AnimatedBottomNavigationBar(
      icons: const [
        Icons.home_outlined,
        Icons.favorite_border,
        Icons.location_on_outlined,
        Icons.person_outline,
      ],
      backgroundColor:
          isDarkMode ? AppConstants.buttonColor : Color(0xFFDBF4D1),
      activeIndex: activeIndex,
      gapLocation: GapLocation.center,
      activeColor: isDarkMode ? Colors.black : AppConstants.buttonColor,
      inactiveColor: isDarkMode ? Colors.black38 : Colors.black54,
      notchSmoothness: NotchSmoothness.softEdge,
      shadow: BoxShadow(
        color: Colors.black.withOpacity(0.1),
        blurRadius: 10,
        offset: Offset(0, 4),
      ),
      onTap: (index) => onTabTapped(index),
    );
  }
}
