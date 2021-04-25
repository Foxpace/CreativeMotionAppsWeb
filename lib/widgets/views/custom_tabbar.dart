import 'package:flutter/material.dart';

/// TabBar of which color can be changed
class ColoredTabBar extends Container implements PreferredSizeWidget {
  /// default constructor
  ColoredTabBar(this.color, this.tabBar);

  /// color to use
  @override
  final Color color;

  /// your tabbar
  final TabBar tabBar;

  @override
  Size get preferredSize => tabBar.preferredSize;

  @override
  Widget build(BuildContext context) => Container(
    color: color,
    child: tabBar,
  );
}