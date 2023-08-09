import 'package:flutter/material.dart';

class SimpleProductWidgetView extends StatelessWidget {
  final String url;
  const SimpleProductWidgetView({
    super.key,
    required this.url,
  });

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1 / 1,
      child: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.network(url),
        ),
      ),
    );
  }
}
