// ignore: file_names
import 'package:amazon_clone/utils/color_theme.dart';
import 'package:amazon_clone/utils/utils.dart';
import 'package:flutter/material.dart';

class ProductWidgetListBarView extends StatelessWidget {
  final String title;
  final List<Widget> children;
  const ProductWidgetListBarView({
    super.key,
    required this.title,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    Size screenSize = Utils().getScreenSize();
    double height = screenSize.height / 4;
    double titleHeight = 25;

    return Container(
      margin: const EdgeInsets.all(8.0),
      padding: const EdgeInsets.all(8.0),
      height: height,
      width: screenSize.width,
      color: Colors.white,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            height: titleHeight,
            child: Row(
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 8),
                  child: Text(
                    "show more",
                    style: TextStyle(
                      color: activeCyanColor,
                      fontSize: 17,
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: height - (titleHeight + 26),
            width: screenSize.width,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: children,
            ),
          )
        ],
      ),
    );
  }
}
