import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.name,
    this.keyboardType,
    this.controller,
  });
  final String name;
  final TextInputType? keyboardType;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        
        hintText: name,
        hintStyle: const TextStyle(
          fontSize: 20,
          color: Colors.black,
          fontWeight: FontWeight.w300,
        ),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(16)),
        ),
      ),
      keyboardType: keyboardType,
      textInputAction: TextInputAction.next,
      style: const TextStyle(
        fontSize: 23,
        color: Colors.black,
      ),
    );
  }
}
