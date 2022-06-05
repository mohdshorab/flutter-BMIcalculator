import 'dart:ui';

import 'package:bmi_flutter_application/utils/constants.dart';
import 'package:flutter/material.dart';

class BottomButtonWidget extends StatelessWidget {
  final String text;
  final VoidCallback onTap;

  const BottomButtonWidget(
      {Key? key, required this.text, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        child: Center(
          child: 
          Text(
            text,
            style: kBottomButtonTextStyle, textAlign: TextAlign.center, 
          ),
        ),
        color: kBottomButtonContainerColor,
        height: kBottomButtonContainerHeight,
        width: double.infinity,
        margin: const EdgeInsets.all(16.0),
      ),
      onTap: onTap,
    );
  }
}
