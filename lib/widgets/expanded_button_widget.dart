import 'package:flutter/material.dart';
import 'package:highlights/utils/appcolors.dart';

class ExpandedButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Widget child;
  final Color buttonColor;


  const ExpandedButton({Key? key, required this.onPressed, required this.child, required this.buttonColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: InkWell(
          onTap: onPressed,
          borderRadius: BorderRadius.circular(8), // Adjust the radius as needed
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: buttonColor,
              borderRadius: BorderRadius.circular(8), // Adjust the radius as needed
            ),
            child: Center(
              child: child,
            ),
          ),
        ),
      ),
    );
  }
}