import 'package:flutter/material.dart';
import 'package:iamge_to_text/features/recognition/presentation/screens/recognition_screen.dart';

void main() {
  runApp(const ExtractTextFromImage());
}

class ExtractTextFromImage extends StatelessWidget {
  const ExtractTextFromImage({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: RecognitionScreen(),
    );
  }
}
