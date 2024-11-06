import 'package:flutter/material.dart';

/// Applies custom clipper over scrollable tab bar pages,
/// so content scrolls behind center gradient button.
///
/// Note: Scrollable needs to enable clipBehavior: Clip.none
class TabScrollablePage extends StatelessWidget {
  const TabScrollablePage({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: TabBarClipper(),
      child: child,
    );
  }
}

class TabBarClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();

    path.moveTo(0, 0);
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height + kBottomNavigationBarHeight);
    path.lineTo(0, size.height + kBottomNavigationBarHeight);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
