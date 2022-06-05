import 'package:bmi_flutter_application/screens/resultPageForBmi.dart';
import 'package:bmi_flutter_application/services/calculateBMIService.dart';
import 'package:bmi_flutter_application/utils/constants.dart';
import 'package:bmi_flutter_application/widgets/bottomButtonWidget.dart';
import 'package:bmi_flutter_application/widgets/cardControl.dart';
import 'package:bmi_flutter_application/widgets/iconWidget.dart';
import 'package:bmi_flutter_application/widgets/roundedIconWidget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

enum Gender { male, female }

class BMIInput extends StatefulWidget {
  const BMIInput({Key? key}) : super(key: key);

  @override
  State<BMIInput> createState() => _BMIInputState();
}

class _BMIInputState extends State<BMIInput> {
  Gender selectedGender = Gender.male;
  double height = 180.0;
  double weight = 70;
  int age = 24;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kIconBackgroundColor,
      appBar: AppBar(
        backgroundColor: kIconBackgroundColor,
        leading: const Icon(FontAwesomeIcons.barsStaggered),
        title: const Text(
          'BMI CALCULATOR',
          style: kHeadingTextStyle,
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: CardControl(
                        bgColor: selectedGender == Gender.male
                            ? kCardActiveBGColor
                            : kCardInActiveBGColor,
                        cardChild: const IconWidget(
                          iconData: FontAwesomeIcons.child,
                          text: 'MALE',
                        ),
                        onPress: () {
                          setState(() {
                            selectedGender = Gender.male;
                          });
                        }),
                  ),
                  Expanded(
                    child: CardControl(
                        bgColor: selectedGender == Gender.female
                            ? kCardActiveBGColor
                            : kCardInActiveBGColor,
                        cardChild: const IconWidget(
                          iconData: FontAwesomeIcons.child,
                          text: 'FEMALE',
                        ),
                        onPress: () {
                          setState(() {
                            selectedGender = Gender.female;
                          });
                        }),
                  ),
                ],
              ),
            ),
            Expanded(
              child: CardControl(
                  bgColor: kCardInActiveBGColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'HEIGHT',
                        style: kSubHeadingTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text(
                            height.toStringAsFixed(1),
                            style: kNumberTextStyle,
                          ),
                          const Text(
                            'cm',
                            style: kSubHeadingTextStyle,
                          ),
                        ],
                      ),
                      SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                          activeTrackColor: kSliderActiveColor,
                          inactiveTrackColor: kSliderInactiveColor,
                          trackShape: const RectangularSliderTrackShape(),
                          trackHeight: 6.0,
                          thumbColor: kSliderThumbColor,
                          thumbShape: const RoundSliderThumbShape(
                            enabledThumbRadius: 12.0,
                          ),
                          overlayColor: kSliderThumbColor,
                          overlayShape: const RoundSliderOverlayShape(
                            overlayRadius: 20.0,
                          ),
                        ),
                        child: Slider(
                          value: height,
                          min: 100.0,
                          max: 300.0,
                          onChanged: (newValue) {
                            setState(() {
                              height = newValue;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                  onPress: () {}),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: CardControl(
                        bgColor: kCardInActiveBGColor,
                        cardChild: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text('WEIGHT', style: kSubHeadingTextStyle),
                            Text(
                              '$weight',
                              style: kNumberTextStyle,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: RoundedIcon(
                                      iconData: FontAwesomeIcons.minus,
                                      onPressed: () {
                                        setState(() {
                                          weight--;
                                        });
                                      }),
                                ),
                                Expanded(
                                  child: RoundedIcon(
                                      iconData: FontAwesomeIcons.plus,
                                      onPressed: () {
                                        setState(() {
                                          weight++;
                                        });
                                      }),
                                ),
                              ],
                            )
                          ],
                        ),
                        onPress: () {}),
                  ),
                  Expanded(
                    child: CardControl(
                        bgColor: kCardInActiveBGColor,
                        cardChild: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text('AGE', style: kSubHeadingTextStyle),
                            Text(
                              '$age',
                              style: kNumberTextStyle,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: RoundedIcon(
                                      iconData: FontAwesomeIcons.minus,
                                      onPressed: () {
                                        setState(() {
                                          age--;
                                        });
                                      }),
                                ),
                                Expanded(
                                  child: RoundedIcon(
                                      iconData: FontAwesomeIcons.plus,
                                      onPressed: () {
                                        setState(() {
                                          age++;
                                        });
                                      }),
                                ),
                              ],
                            )
                          ],
                        ),
                        onPress: () {}),
                  ),
                ],
              ),
            ),
            BottomButtonWidget(
                text: 'CALCULATE YOUR BMI',
                onTap: () {
                  var bmi = CalculateBMI(height, weight);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BMIResultPage(
                        bmiValue: bmi.getTheBmi(),
                        bmiNarration: bmi.getNarration(),
                        bmiResult: bmi.getWeightLevel(),
                      ),
                    ),
                  );
                }),
          ],
        ),
      ),
    );
  }
}
