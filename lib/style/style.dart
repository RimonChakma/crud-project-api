import 'package:flutter/material.dart';

InputDecoration inputDecoratorStyle (label){
  return InputDecoration(
      focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.black)
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: Colors.white
    )
  ),
    labelText: label,
    filled: true,
    fillColor: Colors.white
  );
}