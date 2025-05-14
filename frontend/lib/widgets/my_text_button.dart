import 'package:flutter/material.dart';

class MyTextButton extends StatefulWidget {
  final String text;
  final Color? textColor;
  final Color? focusedTextColor;
  final double? fontSize;
  final Function()? onPressed;
  final EdgeInsetsGeometry? padding;

  const MyTextButton({
    super.key,
    required this.text,
    this.textColor,
    this.focusedTextColor,
    this.onPressed,
    this.fontSize,
    this.padding,
  });

  @override
  State<MyTextButton> createState() => _MyTextButtonState();
}

class _MyTextButtonState extends State<MyTextButton> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (event) {
        setState(() {
          isSelected = true;
        });
      },
      onExit: (event) {
        setState(() {
          isSelected = false;
        });
      },
      child: GestureDetector(
        onTap: widget.onPressed,
        child: Padding(
          padding: widget.padding ?? EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          child: Text(
            widget.text,
            style: TextStyle(
              fontSize: widget.fontSize,
              color: isSelected ? (widget.focusedTextColor ?? Colors.black) : widget.textColor ?? Colors.grey[800],
            ),
          ),
        ),
      ),
    ); //
  }
}
