import 'package:flutter/material.dart';
import 'package:tailor_size/config/theming.dart';

import '../statics/statics.dart';

void errorDialog(BuildContext context, {required String? content, VoidCallback? onOkAction, bool? barrierDismissible, Widget? child }) {
  Widget okButton() {
    return TextButton(onPressed: () => onOkAction ?? Navigator.pop(context), child: child ?? const Text(
      'OK',
      style: TextStyle(fontWeight: bold,
          color: AppThemeData.textError,
      ),
    ),);
  }


  AlertDialog alert = AlertDialog(
    title: const Text(
      'Erreur',
      style: TextStyle(color: AppThemeData.textError, fontWeight: bold),
    ),
    content: Text(
      content!,
    ),
    actions: [
      okButton(),
    ],
  );

  showDialog(
      barrierDismissible: barrierDismissible ?? false, context: context, builder: (context) => alert);
}



void warningDialog(BuildContext context, {required String? content, VoidCallback? onOkAction, bool? barrierDismissible, Widget? child, String? title }) {
  Widget okButton() {
    return TextButton(onPressed: () => onOkAction ?? Navigator.pop(context), child: child ?? const Text(
      'OK',
      style: TextStyle(fontWeight: bold,
        color: AppThemeData.primaryColor,
      ),
    ),);
  }


  AlertDialog alert = AlertDialog(
    title:  Text(
      title ?? 'Alerte',
      style: const TextStyle(color: AppThemeData.textError, fontWeight: bold),
    ),
    content: Text(
      content!,
    ),
    actions: [
      okButton(),
    ],
  );

  showDialog(
      barrierDismissible: barrierDismissible ?? false, context: context, builder: (context) => alert);
}

