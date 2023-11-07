import 'package:flutter/material.dart';
import 'package:tailor_size/config/theming.dart';
import 'package:tailor_size/presentation/presentation.dart';
import 'package:tailor_size/statics/constants.dart';
import 'package:tailor_size/utils/measure_decoration.dart';

class MeasureScreen extends StatelessWidget {
  static const String routeName = '/MeasureScreen';
  const MeasureScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back,
            color: AppThemeData.iconBlack,
          ),
        ),
        title: const Text(
          'Mesure',
          style: TextStyle(
              color: AppThemeData.textBlack, fontWeight: FontWeight.normal),
        ),
        actions:  [
          Padding(
            padding: const EdgeInsets.only(right: 20.0, top: 20),
            child: GestureDetector(
              onTap: (){
                Navigator.pushNamed(context, MeasureProfileScreen.routeName);
              },
                child: const Text('Suivant', style: TextStyle(color: AppThemeData.textBlack),)),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: padding20,
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                    child: TextFormField(
                  decoration: customFieldDecoration('LT'),
                )),
                horizontalSpacer10,
                Expanded(child: TextFormField(
                  decoration: customFieldDecoration('CC'),
                )),
              ],
            ),
            verticalSpacer10,
            Row(
              children: [
                Expanded(child: TextFormField(
                  decoration: customFieldDecoration('CV'),
                )),
                horizontalSpacer10,
                Expanded(child: TextFormField(
                  decoration: customFieldDecoration('LTP'),
                )),
              ],
            ),
            verticalSpacer10,
            Row(
              children: [
                Expanded(child: TextFormField(
                  decoration: customFieldDecoration('CP'),
                )),
                horizontalSpacer10,
                Expanded(child: TextFormField(
                  decoration: customFieldDecoration('CF'),
                )),
              ],
            ),
            verticalSpacer10,
            Row(
              children: [
                Expanded(child: TextFormField(
                  decoration: customFieldDecoration('EP'),
                )),
                horizontalSpacer10,
                Expanded(child: TextFormField(
                  decoration: customFieldDecoration('Cc'),
                )),
              ],
            ),
            verticalSpacer10,
            Row(
              children: [
                Expanded(child: TextFormField(
                  decoration: customFieldDecoration('C'),
                )),
                horizontalSpacer10,
                Expanded(child: TextFormField(
                  decoration: customFieldDecoration('TC'),
                )),
              ],
            ),
            verticalSpacer10,
            Row(
              children: [
                Expanded(child: TextFormField(
                  decoration: customFieldDecoration('CB'),
                )),
                horizontalSpacer10,
                Expanded(child: TextFormField(
                  decoration: customFieldDecoration('P'),
                )),
              ],
            ),
            verticalSpacer10,
            Row(
              children: [
                Expanded(child: TextFormField(
                  decoration: customFieldDecoration('Cb'),
                )),
                horizontalSpacer10,
               Expanded(child: Container()),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

