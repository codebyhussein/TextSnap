import 'package:flutter/material.dart';

class AppStyle {
  static Decoration backgroundDecoration = const BoxDecoration(
      image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(
            'assets/images/backgrond_image.webp',
          )));

  static Decoration contanierDecoration = BoxDecoration(
      borderRadius: BorderRadius.circular(25),
      border: Border.all(
        color: Colors.black,
      ));

  static TextStyle style16 = const TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.bold,
    fontSize: 16,
  );

  static TextStyle style18 = const TextStyle(
      color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18);
}
