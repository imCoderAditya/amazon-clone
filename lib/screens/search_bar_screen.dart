import 'package:amazon_clone/widget/search_bar_widget.dart';
import 'package:flutter/material.dart';

class SearchBarScreen extends StatelessWidget {
  const SearchBarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: SearchBarWidget(
          isReadyOnly: false,
          hasBackbutton: true,
        ),
      ),
    );
  }
}
