import 'package:bmi_flutter_application/utils/constants.dart';
import 'package:bmi_flutter_application/widgets/bottomButtonWidget.dart';
import 'package:bmi_flutter_application/widgets/cardControl.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BMIResultPage extends StatelessWidget {
  final String bmiValue;
  final String bmiResult;
  final String bmiNarration;

  const BMIResultPage({
    Key? key,
    required this.bmiValue,
    required this.bmiNarration,
    required this.bmiResult,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kIconBackgroundColor,
        leading: const Icon(FontAwesomeIcons.barsStaggered),
        title: const Text(
          'BMI CALCULATOR',
          style: kHeadingTextStyle,
        ),
      ),
      body: Container(
        color: kIconBackgroundColor,
        child: Column(
          children: [
            const Text(
              'Your Result',
              style: TextStyle(fontSize: 22),
            ),
            Expanded(
                child: CardControl(
                    bgColor: kCardActiveBGColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          bmiResult,
                          style: kBottomButtonTextStyle,
                          textAlign: TextAlign.center,
                        ),
                        Text(bmiValue,
                            style: kNumberTextStyle,
                            textAlign: TextAlign.center),
                        const Text(
                          'Normal BMI Range :',
                          style: kSubHeadingTextStyle,
                        ),
                        const Text(
                          '18.5  -  25',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        Text(
                          bmiNarration,
                          style: kSubHeadingTextStyle,
                          textAlign: TextAlign.center,
                        )
                      ],
                    ),
                    onPress: () {})),
            Expanded(
              child: BottomButtonWidget(
                text: 'RE_CALCULATE YOUR BMI',
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
