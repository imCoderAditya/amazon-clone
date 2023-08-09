import 'package:amazon_clone/utils/utils.dart';
import 'package:flutter/material.dart';

class CustomMainButton extends StatefulWidget {
  final Widget child;
  final Color color;
  final bool isLoading;
  final VoidCallback onPressed;

  CustomMainButton({
    required this.child,
    required this.color,
    required this.isLoading,
    required this.onPressed,
    super.key,
  });

  @override
  State<CustomMainButton> createState() => _CustomMainButtonState();
}

class _CustomMainButtonState extends State<CustomMainButton> {
  @override
  Widget build(BuildContext context) {
    Size screenSize = Utils().getScreenSize();
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: widget.color,
        fixedSize: Size(
          screenSize.width * 0.5,
          40,
        ),
      ),
      onPressed: widget.onPressed,
      child: widget.isLoading
          ? const Padding(
              padding: EdgeInsets.symmetric(vertical: 5),
              child: AspectRatio(
                aspectRatio: 1 / 1,
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              ),
            )
          : widget.child,
    );
  }
}
