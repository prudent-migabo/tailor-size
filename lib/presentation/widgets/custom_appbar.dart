import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

PreferredSize customAppBar ({required VoidCallback onBackEvent, required String title, List<Widget>? actions}){
  return PreferredSize(
      preferredSize: const Size.fromHeight(56),
      child: AppBar(
        leading: GestureDetector(
          onTap: onBackEvent,
          child: const Icon(Icons.arrow_back_outlined),
        ),
        title: Text(title),
        actions: actions,
      ));
}