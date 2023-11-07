import 'package:flutter/material.dart';

InputDecoration customFieldDecoration (String hintText){
  return InputDecoration(
    hintText: hintText,
    hintStyle: const TextStyle(fontSize: 13),
    labelText: hintText,
  );
}