import 'package:flutter/material.dart';

class TextElevatedButton extends StatefulWidget {
  final VoidCallback? onPressed;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final Color? selectedBackgroundColor;
  final Color? selectedForegroundColor;
  final BorderRadius? radius;
  final Widget child;

  const TextElevatedButton({
    super.key,
    this.onPressed,
    this.backgroundColor,
    this.foregroundColor,
    this.selectedBackgroundColor,
    this.selectedForegroundColor,
    this.radius,
    required this.child,
  });

  @override
  State<TextElevatedButton> createState() => _TextElevatedButtonState();
}

class _TextElevatedButtonState extends State<TextElevatedButton> {
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
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: isSelected ? widget.selectedBackgroundColor : widget.backgroundColor,
          foregroundColor: isSelected ? widget.selectedForegroundColor : widget.foregroundColor,
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          textStyle: TextStyle(fontSize: 16),
          shape: RoundedRectangleBorder(borderRadius: widget.radius ?? BorderRadius.circular(4)),
          shadowColor: Colors.transparent,
          animationDuration: Duration(milliseconds: 30),
        ),
        onPressed: widget.onPressed,
        child: widget.child,
      ),
    );
  }
}
