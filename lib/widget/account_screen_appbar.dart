import 'package:amazon_clone/utils/color_theme.dart';
import 'package:amazon_clone/utils/constants.dart';
import 'package:flutter/material.dart';

import '../utils/utils.dart';

class AccountScreenAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  final Size preferredSize;
  const AccountScreenAppBar({super.key})
      : preferredSize = const Size.fromHeight(kAppBarHeight);

  @override
  Widget build(BuildContext context) {
    Size screenSize = Utils().getScreenSize();
    return Container(
      height: kAppBarHeight,
      width: screenSize.width,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: backgroundGradient,
          begin: Alignment.centerLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8),
            child: Image.network(
              amazonLogoUrl,
              height: kAppBarHeight * 0.7,
            ),
          ),
          Row(
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.search),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.notifications),
              ),
            ],
          )
        ],
      ),
    );
  }
}
