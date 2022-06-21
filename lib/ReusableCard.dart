// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// class ReusableCard extends StatelessWidget {
//   const ReusableCard({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//                     onTap: () {
//                       setState(() {
//                         selectedGender = Gender.male;
//                         // updateColor(Gender.male);
//                       });
//                     },
//                     child: 
//                     (
//                         selectedGender == Gender.male
//                             ? activeCardColor
//                             : inactiveCardColor,
//                         MFWidget(icon: FontAwesomeIcons.mars, label: "MALE")),
//                   ))
//   }
// }