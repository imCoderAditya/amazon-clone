import 'package:flutter/material.dart';

class ResponsivePage extends StatelessWidget {
  static const double tablateWithLimit = 1100;
  static const double mobileWithLimit = 650;

  final Widget mobile;
  final Widget desktop;
  final Widget tablate;
  const ResponsivePage(
      {super.key,
      required this.mobile,
      required this.desktop,
      required this.tablate});

  static bool isDesktop(BuildContext context) {
    return MediaQuery.of(context).size.width >= tablateWithLimit;
  }

  static bool isTablate(BuildContext context) {
    return MediaQuery.of(context).size.width >= mobileWithLimit &&
        MediaQuery.of(context).size.width <= tablateWithLimit;
  }

  static bool isMobile(BuildContext context) {
    return MediaQuery.of(context).size.width <= mobileWithLimit;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (p0, p1) {
        if (p1.maxWidth > tablateWithLimit) {
          return desktop;
        } else if (p1.maxWidth > mobileWithLimit &&
            p1.maxWidth < tablateWithLimit) {
          return tablate;
        } else {
          return mobile;
        }
      },
    );
  }
}
