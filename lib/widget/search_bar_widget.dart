import 'package:amazon_clone/resourse/responsive.dart';
import 'package:amazon_clone/screens/search_bar_screen.dart';
import 'package:amazon_clone/utils/color_theme.dart';
import 'package:amazon_clone/utils/constants.dart';
import 'package:amazon_clone/utils/utils.dart';
import 'package:flutter/material.dart';

class SearchBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final bool isReadyOnly;
  final bool hasBackbutton;

  SearchBarWidget({
    Key? key,
    required this.isReadyOnly,
    required this.hasBackbutton,
  })  : preferredSize = const Size.fromHeight(kAppBarHeight),
        super(key: key);

  @override
  final Size preferredSize;

  OutlineInputBorder border = OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
    borderSide: const BorderSide(
      color: Colors.grey,
      width: 1,
    ),
  );

  @override
  Widget build(BuildContext context) {
    Size screenSize = Utils().getScreenSize();
    return Container(
      height: kAppBarHeight,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: backgroundGradient,
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
      ),
      child: Flexible(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            hasBackbutton
                ? IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.arrow_back),
                  )
                : Container(),
            SizedBox(
              width: ResponsivePage.isDesktop(context)
                  ? screenSize.width * 0.8
                  : screenSize.width * 0.6,
              child: Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        blurRadius: 8,
                        spreadRadius: 1,
                        offset: const Offset(0, 3)),
                  ],
                ),
                child: TextField(
                  onTap: () {
                    if (isReadyOnly) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SearchBarScreen(),
                        ),
                      );
                    }
                  },
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.search),
                    suffixIcon: const Icon(Icons.camera_alt_outlined),
                    hintText: "Search for somthing in amazon",
                    fillColor: Colors.white,
                    filled: true,
                    border: border,
                    focusedBorder: border,
                  ),
                ),
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.mic_none),
            ),
          ],
        ),
      ),
    );
  }
}
