import 'package:flutter/material.dart';
import 'package:iamge_to_text/core/style.dart';

class DefaultButton extends StatelessWidget {
  DefaultButton({super.key, required this.textButton, required this.onPressed});
  void Function()? onPressed;
  String textButton;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: Colors.black,
          )),
      child: TextButton(
          onPressed: onPressed,
          child: Text(textButton, style: AppStyle.style18)),
    );
  }
}
