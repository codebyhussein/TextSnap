import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iamge_to_text/features/recognition/presentation/screens/recognition_screen.dart';

void main() {
  runApp(const ExtractTextFromImage());
}

class ExtractTextFromImage extends StatelessWidget {
  const ExtractTextFromImage({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return const MaterialApp(
          debugShowCheckedModeBanner: false,
          home: RecognitionScreen(),
        );
      },
    );
  }
}
