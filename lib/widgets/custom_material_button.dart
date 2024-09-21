import 'package:flutter/material.dart';
import 'package:mizan_app/constants.dart';

class CustomMaterialButton extends StatelessWidget {
  const CustomMaterialButton({
    super.key,
    required this.buttonName,
    required this.onPressed,
  });

  final String buttonName;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(12),
        ),
      ),
      height: 60,
      minWidth: 100,
      padding: const EdgeInsets.symmetric(
        horizontal: 36,
        vertical: 8,
      ),
      onPressed: onPressed,
      color: kPrimaryColor3,
      child: Text(
        buttonName,
        style: const TextStyle(
          fontSize: 32,
          fontFamily: kfontStyle1,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
