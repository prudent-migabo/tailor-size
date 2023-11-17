import 'package:flutter/material.dart';
import 'package:tailor_size/config/theming.dart';
import 'package:tailor_size/data/data.dart';
import 'package:tailor_size/data/models/client_arguments.dart';
import 'package:tailor_size/presentation/presentation.dart';
import 'package:tailor_size/statics/constants.dart';
import 'package:tailor_size/utils/measure_decoration.dart';

class MeasureScreen extends StatefulWidget {
  static const String routeName = '/MeasureScreen';
  const MeasureScreen({Key? key, required this.clientArguments}) : super(key: key);

  final ClientArguments clientArguments;

  @override
  State<MeasureScreen> createState() => _MeasureScreenState();
}

class _MeasureScreenState extends State<MeasureScreen> {
  final TextEditingController _lt = TextEditingController();
  final TextEditingController _cc1 = TextEditingController();
  final TextEditingController _cv = TextEditingController();
  final TextEditingController _ltp = TextEditingController();
  final TextEditingController _cp = TextEditingController();
  final TextEditingController _cf = TextEditingController();
  final TextEditingController _ep = TextEditingController();
  final TextEditingController _cc2 = TextEditingController();
  final TextEditingController _c = TextEditingController();
  final TextEditingController _tc = TextEditingController();
  final TextEditingController _cb1 = TextEditingController();
  final TextEditingController _p = TextEditingController();
  final TextEditingController _cb2 = TextEditingController();

  onSubmit(){
    Navigator.pushNamed(context, MeasureProfileScreen.routeName, arguments: ClientArguments(clientModel: ClientModel(
      fullName: widget.clientArguments.clientModel.fullName,
      profession: widget.clientArguments.clientModel.profession,
      email: widget.clientArguments.clientModel.email,
      phone: widget.clientArguments.clientModel.phone,
      c: _c.text.trim(),
      cb1: _cb1.text.trim(),
      cb2: _cb2.text.trim(),
      cf: _cf.text.trim(),
      cc1: _cc1.text.trim(),
      cp: _cp.text.trim(),
      cc2: _cc2.text.trim(),
      cv: _cv.text.trim(),
      ep: _ep.text.trim(),
      lt: _lt.text.trim(),
      ltp: _ltp.text.trim(),
      p: _p.text.trim(),
      tc: _tc.text.trim(),
    )));
  }

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
            padding: const EdgeInsets.only(right: 20.0, top: 0),
            child: GestureDetector(
              onTap: onSubmit,
                child: const Text('Suivant', style: TextStyle(color: AppThemeData.textBlack),),),
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
                      keyboardType: TextInputType.number,
                      controller: _lt,
                  decoration: customFieldDecoration('LT'),
                )),
                horizontalSpacer10,
                Expanded(child: TextFormField(
                  keyboardType: TextInputType.number,
                  controller: _cc1,
                  decoration: customFieldDecoration('CC'),
                )),
              ],
            ),
            verticalSpacer10,
            Row(
              children: [
                Expanded(child: TextFormField(
                  keyboardType: TextInputType.number,
                  controller: _cv,
                  decoration: customFieldDecoration('CV'),
                )),
                horizontalSpacer10,
                Expanded(child: TextFormField(
                  keyboardType: TextInputType.number,
                  controller: _ltp,
                  decoration: customFieldDecoration('LTP'),
                )),
              ],
            ),
            verticalSpacer10,
            Row(
              children: [
                Expanded(child: TextFormField(
                  keyboardType: TextInputType.number,
                  controller: _cp,
                  decoration: customFieldDecoration('CP'),
                )),
                horizontalSpacer10,
                Expanded(child: TextFormField(
                  keyboardType: TextInputType.number,
                  controller: _cf,
                  decoration: customFieldDecoration('CF'),
                )),
              ],
            ),
            verticalSpacer10,
            Row(
              children: [
                Expanded(child: TextFormField(
                  keyboardType: TextInputType.number,
                  controller: _ep,
                  decoration: customFieldDecoration('EP'),
                )),
                horizontalSpacer10,
                Expanded(child: TextFormField(
                  keyboardType: TextInputType.number,
                  controller: _cc2,
                  decoration: customFieldDecoration('Cc'),
                )),
              ],
            ),
            verticalSpacer10,
            Row(
              children: [
                Expanded(child: TextFormField(
                  keyboardType: TextInputType.number,
                  controller: _c,
                  decoration: customFieldDecoration('C'),
                )),
                horizontalSpacer10,
                Expanded(child: TextFormField(
                  keyboardType: TextInputType.number,
                  controller: _tc,
                  decoration: customFieldDecoration('TC'),
                )),
              ],
            ),
            verticalSpacer10,
            Row(
              children: [
                Expanded(child: TextFormField(
                  keyboardType: TextInputType.number,
                  controller: _cb1,
                  decoration: customFieldDecoration('CB'),
                )),
                horizontalSpacer10,
                Expanded(child: TextFormField(
                  keyboardType: TextInputType.number,
                  controller: _p,
                  decoration: customFieldDecoration('P'),
                )),
              ],
            ),
            verticalSpacer10,
            Row(
              children: [
                Expanded(child: TextFormField(
                  keyboardType: TextInputType.number,
                  controller: _cb2,
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

