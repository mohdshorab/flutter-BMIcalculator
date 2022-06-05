import 'package:bmi_flutter_application/utils/constants.dart';
import 'package:flutter/material.dart';

class RoundedIcon extends StatelessWidget {
  final IconData iconData;
  final VoidCallback onPressed;


  const RoundedIcon({ Key? key, required this.iconData, required this.onPressed }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      constraints: const BoxConstraints.tightFor(height: 50.0, width: 50.0),
      shape:const CircleBorder(),
      fillColor: kRoundedIconButtonColor,
      child: Icon(iconData),
      
    );
  }
}