import 'package:amazon_clone/utils/color_theme.dart';
import 'package:amazon_clone/utils/constants.dart';
import 'package:flutter/material.dart';

class BannerAddWidget extends StatefulWidget {
  const BannerAddWidget({super.key});

  @override
  State<BannerAddWidget> createState() => _BannerAddWidgetState();
}

class _BannerAddWidgetState extends State<BannerAddWidget> {
  int currentAdd = 0;
  double smallHeight = 90;
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return GestureDetector(
      onHorizontalDragEnd: ((details) {
        if (currentAdd == (largeAds.length - 1)) {
          currentAdd = -1;
        } else {
          setState(() {
            currentAdd++;
          });
        }
      }),
      child: Column(
        children: [
          Stack(
            children: [
              Image.network(
                largeAds[currentAdd],
                width: double.infinity,
              ),
              Positioned(
                bottom: 0,
                child: Container(
                  width: screenSize.width,
                  height: 100,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                      backgroundColor,
                      backgroundColor.withOpacity(0),
                    ],
                  )),
                ),
              ),
            ],
          ),
          Container(
              color: backgroundColor,
              width: screenSize.width,
              height: smallHeight,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  getSmallAdsFromIndex(0, smallHeight),
                  getSmallAdsFromIndex(1, smallHeight),
                  getSmallAdsFromIndex(2, smallHeight),
                  getSmallAdsFromIndex(3, smallHeight),
                ],
              ))
        ],
      ),
    );
  }
}

Widget getSmallAdsFromIndex(int index, double height) {
  return SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    child: Container(
      height: height,
      width: height,
      decoration: ShapeDecoration(
        color: Colors.white,
        shadows: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 5,
            spreadRadius: 1,
          )
        ],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.network(smallAds[index]),
            Text(
              adItemNames[index],
            ),
          ],
        ),
      ),
    ),
  );
}
