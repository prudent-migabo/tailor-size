import 'package:flutter/material.dart';
import 'package:tailor_size/config/theming.dart';

InputDecoration dashboardFieldDecor(){
  return InputDecoration(
      contentPadding:
      const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
      fillColor: AppThemeData.backgroundGrey,
      filled: true,
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: const BorderSide(color: Colors.transparent),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: const BorderSide(color: Colors.transparent),
      ),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(
              color: Colors.transparent, width: 1)),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: const BorderSide(color: Colors.transparent),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      hintText: 'Rechercher un client',
      hintStyle:
      const TextStyle(fontSize: 13, color: Colors.white));
}