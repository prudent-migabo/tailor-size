import 'package:flutter/material.dart';
import 'package:tailor_size/config/theming.dart';
import 'package:tailor_size/statics/constants.dart';
import 'package:tailor_size/statics/statics.dart';

class MeasureProfileScreen extends StatelessWidget {
  static const String routeName = '/MeasureProfileScreen';
  const MeasureProfileScreen({Key? key}) : super(key: key);

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
          'Profile',
          style: TextStyle(
              color: AppThemeData.textBlack, fontWeight: FontWeight.normal),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 20.0, top: 20),
            child: Text('Sauvegarder', style: TextStyle(color: AppThemeData.textBlack),),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: padding20,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Epaules'),
            const SizedBox(height: 5,),
            Row(
              children: [
                Expanded(child: Image.asset(Assets.shoulder1)),
                Expanded(child: Image.asset(Assets.shoulder2)),
                Expanded(child: Image.asset(Assets.shoulder3)),
              ],
            ),
            const SizedBox(height: 15,),
            const Text('Ventre'),
            const SizedBox(height: 5,),
            Row(
              children: [
                Expanded(child: Image.asset(Assets.belly1)),
                Expanded(child: Image.asset(Assets.belly2)),
                Expanded(child: Image.asset(Assets.belly3)),
              ],
            ),
            const SizedBox(height: 15,),
            const Text('Buste'),
            const SizedBox(height: 5,),
            Row(
              children: [
                Expanded(child: Image.asset(Assets.bust1)),
                Expanded(child: Image.asset(Assets.bust2)),
                Expanded(child: Image.asset(Assets.bust3)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
