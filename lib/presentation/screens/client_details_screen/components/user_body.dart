import 'package:flutter/material.dart';
import 'package:tailor_size/presentation/presentation.dart';

class UserBody extends StatelessWidget {
  const UserBody({Key? key, required this.lt, required this.cv, required this.cp, required this.ep, required this.c, required this.cb1, required this.cb2, required this.cc1, required this.cf, required this.cc2, required this.tc, required this.p, required this.ltp}) : super(key: key);

  final String lt;
  final String cv;
  final String cp;
  final String ep;
  final String c;
  final String cb1;
  final String cb2;
  final String cc1;
  final String cf;
  final String cc2;
  final String tc;
  final String p;
  final String ltp;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomRowUserDetailsText(title: 'LT  :', description: lt),
            const Spacer(),
            CustomRowUserDetailsText(title: 'CV :', description: cv),
            const Spacer(),
            CustomRowUserDetailsText(title: 'CP :', description: cp),
            const Spacer(),
            CustomRowUserDetailsText(title: 'EP :', description: ep),
            const Spacer(),
            CustomRowUserDetailsText(title: 'C   :', description: c),
            const Spacer(),
            CustomRowUserDetailsText(title: 'CB :', description: cb1),
            const Spacer(),
            CustomRowUserDetailsText(title: 'Cb :', description: cb2),
          ],
        ),),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomRowUserDetailsText(title: 'CC :', description: cc1),
              const Spacer(),
              CustomRowUserDetailsText(title: 'P   :', description: p),
              const Spacer(),
              CustomRowUserDetailsText(title: 'CF :', description: cf),
              const Spacer(),
              CustomRowUserDetailsText(title: 'Cc :', description: cc2),
              const Spacer(),
              CustomRowUserDetailsText(title: 'LTP :', description: ltp),
            ],
          ),),
      ],
    );
  }
}

class Spacer extends StatelessWidget {
  const Spacer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SizedBox(height: 6,);
  }
}
