import 'package:flutter/material.dart';

class TextFieldWidget extends StatefulWidget {
  final String title;
  final TextEditingController controller;
  final bool obscureText;
  final String? hintText;
  final Color? cursorColor;

  TextFieldWidget({
    super.key,
    required this.title,
    required this.controller,
    required this.obscureText,
    this.hintText,
    this.cursorColor,
  });

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  late FocusNode focusNode;
  bool isInFocus = false;
  @override
  void initState() {
    super.initState();
    focusNode = FocusNode();
    focusNode.addListener(() {
      if (focusNode.hasFocus) {
        setState(() {
          isInFocus = true;
        });
      } else {
        setState(() {
          isInFocus = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Text(
            widget.title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(boxShadow: [
            isInFocus
                ? BoxShadow(
                    color: Colors.orange.withOpacity(0.4),
                    blurRadius: 10,
                    spreadRadius: 2,
                  )
                : BoxShadow(
                    color: Colors.black.withOpacity(0.4),
                    blurRadius: 10,
                    spreadRadius: 2,
                  ),
          ]),
          child: TextField(
            controller: widget.controller,
            focusNode: focusNode,
            cursorColor: widget.cursorColor,
            obscureText: widget.obscureText,
            maxLines: 1,
            decoration: InputDecoration(
              fillColor: Colors.white,
              filled: true,
              hintText: widget.hintText,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(3),
                borderSide: const BorderSide(
                  color: Colors.black,
                  width: 1,
                ),
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.orange,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
