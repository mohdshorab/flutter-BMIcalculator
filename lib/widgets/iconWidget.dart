import 'package:bmi_flutter_application/utils/constants.dart';
import 'package:flutter/material.dart';

class IconWidget extends StatelessWidget {
  final IconData iconData;
  final String text;

  const IconWidget({Key? key, required this.iconData, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          iconData,
          size: 80.0,
          color: kIconBackgroundColor,
        ),
        const SizedBox(
          height: 15.0,
        ),
        Text(
          text,
          style: kSubHeadingTextStyle,
        ),
      ],
    );
  }
}
