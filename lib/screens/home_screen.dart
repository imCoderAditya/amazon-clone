import 'package:amazon_clone/utils/color_theme.dart';
import 'package:amazon_clone/widget/banner_add_widget.dart';
import 'package:amazon_clone/widget/categeries_horizontal_listview_bar.dart';
import 'package:amazon_clone/widget/product_widget_list%20_bar.dart';
import 'package:amazon_clone/widget/search_bar_widget.dart';
import 'package:amazon_clone/widget/simple_product_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late List<Widget> testChildren = const [
    SimpleProductWidgetView(
      url: "https://m.media-amazon.com/images/I/51QISbJp5-L._SX3000_.jpg",
    ),
    SimpleProductWidgetView(
      url: "https://m.media-amazon.com/images/I/11uufjN3lYL._SX90_SY90_.png",
    ),
    SimpleProductWidgetView(
      url: "https://m.media-amazon.com/images/I/612a5cTzBiL._SX3000_.jpg",
    ),
    SimpleProductWidgetView(
      url: "https://m.media-amazon.com/images/I/11uufjN3lYL._SX90_SY90_.png",
    ),
    SimpleProductWidgetView(
      url: "https://m.media-amazon.com/images/I/61PzxXMH-0L._SX3000_.jpg",
    ),
    SimpleProductWidgetView(
      url: "https://m.media-amazon.com/images/I/612a5cTzBiL._SX3000_.jpg",
    ),
    SimpleProductWidgetView(
      url: "https://m.media-amazon.com/images/I/11uufjN3lYL._SX90_SY90_.png",
    ),
    SimpleProductWidgetView(
      url: "https://m.media-amazon.com/images/I/61PzxXMH-0L._SX3000_.jpg",
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: backgroundColor,
        appBar: SearchBarWidget(
          isReadyOnly: true,
          hasBackbutton: false,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const CategeriesHorizontalListViewbar(),
              const BannerAddWidget(),
              ProductWidgetListBarView(
                title: "Upto 70% off",
                children: testChildren,
              ),
              ProductWidgetListBarView(
                title: "Upto 50% off",
                children: testChildren,
              ),
              ProductWidgetListBarView(
                title: "Upto 30% off",
                children: testChildren,
              ),
              ProductWidgetListBarView(
                title: "Upto 90% off",
                children: testChildren,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
