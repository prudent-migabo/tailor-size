import 'package:flutter/material.dart';
import 'package:tailor_size/config/theming.dart';
import 'package:tailor_size/data/data.dart';
import 'package:tailor_size/data/models/client_arguments.dart';
import 'package:tailor_size/presentation/presentation.dart';
import 'package:tailor_size/statics/constants.dart';
import 'package:tailor_size/utils/measure_decoration.dart';

class UpdateMeasureScreen extends StatefulWidget {
  static const String routeName = '/UpdateMeasureScreen';
  const UpdateMeasureScreen({Key? key, required this.clientArguments}) : super(key: key);

  final ClientArguments clientArguments;

  @override
  State<UpdateMeasureScreen> createState() => _UpdateMeasureScreenState();
}

class _UpdateMeasureScreenState extends State<UpdateMeasureScreen> {
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
    Navigator.pushNamed(context, UpdateMeasureProfileScreen.routeName, arguments: ClientArguments(clientModel: ClientModel(
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
      clientID: widget.clientArguments.clientModel.clientID,
      shoulder: widget.clientArguments.clientModel.shoulder,
      belly: widget.clientArguments.clientModel.belly,
      bust: widget.clientArguments.clientModel.bust,
    )));
  }

  @override
  void initState() {
    _lt.text = '${widget.clientArguments.clientModel.lt}cm';
    _cc1.text = '${widget.clientArguments.clientModel.cc1}cm';
    _cv.text = '${widget.clientArguments.clientModel.cv}cm';
    _ltp.text = '${widget.clientArguments.clientModel.ltp}cm';
    _cp.text = '${widget.clientArguments.clientModel.cp}cm';
    _cf.text = '${widget.clientArguments.clientModel.cf}cm';
    _ep.text = '${widget.clientArguments.clientModel.ep}cm';
    _cc2.text = '${widget.clientArguments.clientModel.cc2}cm';
    _c.text = '${widget.clientArguments.clientModel.c}cm';
    _tc.text = '${widget.clientArguments.clientModel.tc}cm';
    _cb1.text = '${widget.clientArguments.clientModel.cb1}cm';
    _p.text = '${widget.clientArguments.clientModel.p}cm';
    _cb2.text = '${widget.clientArguments.clientModel.cb2}cm';
    super.initState();
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
            padding: const EdgeInsets.only(right: 20.0, top: 20),
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
                      controller: _lt,
                      decoration: customFieldDecoration('LT'),
                    )),
                horizontalSpacer10,
                Expanded(child: TextFormField(
                  controller: _cc1,
                  decoration: customFieldDecoration('CC'),
                )),
              ],
            ),
            verticalSpacer10,
            Row(
              children: [
                Expanded(child: TextFormField(
                  controller: _cv,
                  decoration: customFieldDecoration('CV'),
                )),
                horizontalSpacer10,
                Expanded(child: TextFormField(
                  controller: _ltp,
                  decoration: customFieldDecoration('LTP'),
                )),
              ],
            ),
            verticalSpacer10,
            Row(
              children: [
                Expanded(child: TextFormField(
                  controller: _cp,
                  decoration: customFieldDecoration('CP'),
                )),
                horizontalSpacer10,
                Expanded(child: TextFormField(
                  controller: _cf,
                  decoration: customFieldDecoration('CF'),
                )),
              ],
            ),
            verticalSpacer10,
            Row(
              children: [
                Expanded(child: TextFormField(
                  controller: _ep,
                  decoration: customFieldDecoration('EP'),
                )),
                horizontalSpacer10,
                Expanded(child: TextFormField(
                  controller: _cc2,
                  decoration: customFieldDecoration('Cc'),
                )),
              ],
            ),
            verticalSpacer10,
            Row(
              children: [
                Expanded(child: TextFormField(
                  controller: _c,
                  decoration: customFieldDecoration('C'),
                )),
                horizontalSpacer10,
                Expanded(child: TextFormField(
                  controller: _tc,
                  decoration: customFieldDecoration('TC'),
                )),
              ],
            ),
            verticalSpacer10,
            Row(
              children: [
                Expanded(child: TextFormField(
                  controller: _cb1,
                  decoration: customFieldDecoration('CB'),
                )),
                horizontalSpacer10,
                Expanded(child: TextFormField(
                  controller: _p,
                  decoration: customFieldDecoration('P'),
                )),
              ],
            ),
            verticalSpacer10,
            Row(
              children: [
                Expanded(child: TextFormField(
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

